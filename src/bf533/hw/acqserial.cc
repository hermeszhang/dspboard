#include <hw/acqserial.h>
#include <types.h>
#include <cdefBF533.h>

AcqSerial::AcqSerial() :
  curRXpos_(0), 
  curReadPos_(0),
  totalRXBufCnt_(0)
{
  curRXpos_ = 0; 
  curReadPos_ = 0; 
  for (int i = 0; i < 16; i++) {
    TXBuffer_[i] = 0; 
  }
}

void AcqSerial::setupSPORT()
{
  // first, make sure we can modify the registers
  *pSPORT0_TCR1 = 0x0000;
  *pSPORT0_RCR1 = 0x0000;

  // configure SPORT
  *pSPORT0_RCR2 = 0x000F; // 16-bit word length
  *pSPORT0_TCR2 = 0x000F; // 16-bit word length
  
  // multichannel
  *pSPORT0_MCMC1 = 0x1000; // window size of 16 words
  *pSPORT0_MRCS0 = 0x0000FFFF; //
  *pSPORT0_MRCS1 = 0x00000000; //
  *pSPORT0_MTCS0 = 0x0000FFFF; 
  *pSPORT0_MTCS1 = 0x00000000; 
  *pSPORT0_MCMC2 = 0x1010; // enable mode, one bit after 

} 

void AcqSerial::setupDMA()
{

    // configure SPORT DMA input channel

   *pDMA1_PERIPHERAL_MAP = 0x1000;

   *pDMA1_START_ADDR = &RXbuffer_[0]; 
   *pDMA1_X_COUNT = 16;
   *pDMA1_X_MODIFY = 0x02; // two byte stride
   *pDMA1_Y_COUNT = RXBUFLEN_; //
   *pDMA1_Y_MODIFY = 2; //
   *pDMA1_CURR_DESC_PTR = 0x00;

    // configure SPORT DMA output channel
//    *pDMA2_PERIPHERAL_MAP = 0x2000;

//    *pDMA2_START_ADDR = &TXBuffer_[0]; 
//    *pDMA2_X_COUNT = 4;
//    *pDMA2_X_MODIFY = 0x02; // two byte stride
//    *pDMA2_Y_COUNT = 0;  //
//    *pDMA2_Y_MODIFY = 0; //
//    *pDMA2_CURR_DESC_PTR = 0x00;
   
}

void AcqSerial::start() 
{

  // because the blackfin likes to kick me, 
  // we very clearly have to do a short assignment here
  // to avoid triggering a hardware interrupt

  *pDMA1_CONFIG = 0x10F7;  // start input dma, 2D, autobufferin

  *pSPORT0_RCR1 = 0x4011; // enable sport RX
  *pSPORT0_TCR1 = 0x0000; // enable sport TX

}

void AcqSerial::stop()
{
   *pSPORT0_RCR1 = 0x0000; // disable sport RX
   *pSPORT0_TCR1 = 0x0000; // disable sport TX

}
bool AcqSerial::checkLinkUp()
{
  // install interrupt handlers

  // 
}

void AcqSerial::RXDMAdoneISR(void)
{
  curRXpos_ = (curRXpos_ +1) % RXBUFLEN_; 
  totalRXBufCnt_++; 
}

bool AcqSerial::checkRxEmpty()
{
  if (curRXpos_ == curReadPos_) {
    return true; 
  }    else {
    return false; 
  }
}

void AcqSerial::getNextFrame(AcqFrame * af)
{
  // perform the copy 
  
  af->cmdsts = RXbuffer_[curReadPos_ * 16] & 0xFF; 
  af->cmdid = (RXbuffer_[curReadPos_ * 16] >> 8)  & 0xFF; 
  af->success =0; // not implemented
  
  for(short i = 0; i <10; i++){
    af->samples[i] = RXbuffer_[curReadPos_ * 16 + i +1]; 
  }
  
  curReadPos_ = (curReadPos_ +1) % RXBUFLEN_; 
  
  
}

void AcqSerial::sendCommand(AcqCommand * ac)
{
  *pDMA2_IRQ_STATUS = 0x1; // clear done bit



  // the LSB of the first word sent is: 
  TXBuffer_[0] = 0x00; // major hack !!
  // it appears that the BF SPORT wants to send (TX) the first word one-bit-shift
  // too early. So we just don't send that word. 
  TXBuffer_[1] = 0xAB00 | ((ac->cmdid & 0xF) << 4) | (ac->cmd & 0xF); 
  
  TXBuffer_[2] =  (ac->data >> 16) & 0xFFFF; 
  TXBuffer_[3] =  (ac->data) & 0xFFFF; 

  // start the DMA
  //*pDMA2_CONFIG = 0x00E5;  // start output DMA
  
  
}

bool AcqSerial::sendCommandDone()
{
  return *pDMA2_IRQ_STATUS & 0x01; 
  
}
