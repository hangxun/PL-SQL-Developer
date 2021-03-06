select b.oid, a.DHSDocument_oid, b.contentType, b.title
     bulk collect into  p_body_attachments
     from xmltable('//bodyAttachment' 
          passing p_xml 
          columns                     
                  oid             varchar2(32)   path '@oid',
                  contentType     varchar2(256) path 'contentType/text()',
                  title           varchar2(256)  path 'title/text()'
                  ) b
