select concat('{', '"id": ', rc.id, ', '
           , '"height": ', rc.height, ', '
           , '"length": ', rc.length, ', '
           , '"weight": ', rc.weight, ', '
           , '"width": ', rc.width, ', '
           , '"number": ', rc.number, ', '
           , '"isEmpty": ', rc.is_empty, ', '
           , '"dateOfReceipt": ', '"', FORMAT(CAST(rc.date_of_receipt as datetimeoffset), 'yyyy-MM-ddThh:mm:ss'), '"', 
              ', '
           , '"type": ', '{'
           , '"id": ', dct.id, ', '
           , '"name": ', '"', dct.name, '"', ', '
           , '"mnemo": ', '"', dct.mnemo, '"', '}'
           , '}')
from re_containers rc
         join dbo.dir_container_types dct on dct.id = rc.type_id
