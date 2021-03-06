#ifndef DSPBOARD_AVAILABLE_FIRS_H
#define DSPBOARD_AVAILABLE_FIRS_H

#include "filterio.h"

namespace dspboard { 

class AvailableFIRs
{
public:
  // has event interface
  AvailableFIRs(); 
  
  static const int FILTERNUM = 5; 
  static const int MAXFILTERLEN = 255; 
  sample_t filters[FILTERNUM][MAXFILTERLEN]; 
  unsigned char filterlens[FILTERNUM]; 
  bool filterset[FILTERNUM]; 
  filterid_t filterids[FILTERNUM]; 
  
}; 

}

//static AvailableFIRs availableFIRs; 



#endif // AVAILABLE_FIRS_H
