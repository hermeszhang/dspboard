#!/usr/local/bin/python

from mx.TextTools import *

head_pos = 0
def jump_count(taglist,txt,l,r,subtag):
    global head_pos
    if head_pos is None:
        head_pos = r
    elif head_pos == r:
        raise "InfiniteLoopError", \
              txt[l-20:l]+'{'+txt[l]+'}'+txt[l+1:r+15]
    else:
        head_pos = r

################# body -> statements parser #######################

def tokensFromBody(body_str):
    """
    Input:  A string containing assembly code
    Output: a tuple of
            (statements, comments, labels, includes)
    """
    labels = []
    label_parser = (labels, AppendToTag+Table,
                    (#check for non-white-space
        (None,AllIn,alphanumeric+'._'),
        (None,Is,':'),
        (None,IsIn, white+newline),
        (None,Skip, -1)
        ))

    includes = []
    include_parser = \
                   (includes, AppendToTag+Table,
                    (#check for #
        (None,IsIn,'''.#'''),
        (None,AllNotIn,newline),
        (None,AllIn,newline),
        (None, Skip, -1)
        ))

    comments = []
    comment_parser = \
                   (comments, AppendToTag+Table,
                    (#check for //
        (None,Word,'''//'''),
        (None,AllNotIn,newline),
        (None,AllIn,newline),
        (None, Skip, -1)
        ))
    
    statements = []
    statement_parser = \
                     (statements, AppendToTag+Table,
                      (#check for alphanumeric, run until hit a , or ;
        #need to recurse to do paren matching :>
        (None,IsIn,a2z+A2Z),
        (None,AllNotIn,';,('),
        (None,IsIn,';,',+1,+10),
        (None,AllNotIn,')',-10,-2)))

    tag_table = (
        include_parser+(+1,0),
        comment_parser+(+1,-1),
        label_parser+(+1,-2),
        statement_parser+(+1,-3),
        (None,AllIn,white+newline,+1,-4),
        (None,IsNotIn,white+newline,+1), # uninteresting
        (jump_count, Skip+CallTag, 0),      # Check for infinite loop
        (None,EOF,Here,-7)) # EOF

    result, taglist, nextindex = tag(body_str,tag_table,0,len(body_str))

    return (statements,comments,labels,includes)

################# statement -> set, queried variables parser

def varsFromStatement(st_str=''):
    """
    Input: a single assembly statement
    Output: a tuple ofset and queried variables in the statement
            (set, queried)

    varsFromStatement('r0 = r1') -> (['r0'],['r1'])
    """
    set = []
    qur=[]

    eq_set = (set,AppendToTag+Table,
              (
        (None,AllNotIn,'='),
        (None,Is,'='),
        (None,Skip,-1)), +2, +1)

    eq_qur = (qur,AppendToTag+Table,
              (
        (None,Is,'='),
        (None,AllNotIn,',;'+newline),
        (None,AllIn,',;'+newline)),+1,-3)

    statement_table = ((None,Word,'''rts''',+1,0),
                       (None,Table,((None,Word,'''if'''),
                                    (None,AllIn,white),
                                    (None,AllIn,alpha+'_.'),
                                    (None,AllIn,white))
                        ,+1,-1),
                       eq_set,
                       eq_qur,
                       (None,IsNotIn,'',-4),
                       (None,EOF,Here,-5),
                       )

    st_result, st_taglist, st_nextindex = tag(st_str,statement_table,0,len(text))

    set = map(lambda t: st_str[t[1]:t[2]], set)
    qur = map(lambda t: st_str[t[1]:t[2]], qur)

    print set

    return (set,qur)

def varsFromStatements(st_lst):
    """
    Input: a list of statements
    Output: a tuple of set and queried variables
            (set, queried)

            (['r0','r1'],['r3','r4'])
    """
    set = []
    qur = []
    for i in st_lst:
        tmp = varsFromStatement(i)
        set.extend(tmp[0])
        qur.extend(tmp[1])

    return (set,qur)

if __name__ == '__main__':
    
    import sys

    # read in a file
    f = open(sys.argv[1])
    text = f.read()


    body_tokens = tokensFromBody(text)

    statements = map(lambda x: text[x[1]:x[2]],body_tokens[0])

    s_q_vars = varsFromStatements(statements)

    set = s_q_vars[0]
    qur = s_q_vars[1]

#    for i in taglist:
#        print i,' ', text[i[1]:i[2]]

#    print 'labels'
#    for n,l,r,d in labels:
#        print ' ',text[l:r]
#    print
#    print 'comments'
#    for n,l,r,d in comments:
#        print ' ',text[l:r]
#    print
#    print 'includes'
#    for n,l,r,d in includes:
#        print ' ',text[l:r]
#    print
#    print 'statements'
#    for n,l,r,d in statements:
#        print ' ',text[l:r]
#    print

#    print statement_body

    print 'set'
    for i in set:
        print ' ' ,i
    print

    for i in qur:
        print ' ' ,i
    print