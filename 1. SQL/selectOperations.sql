select concat('{'
           , '"id": ', ro.id, ', '
           , '"dateStart": ', '"', FORMAT(CAST(ro.date_start as datetimeoffset), 'yyyy-MM-ddThh:mm:ss'), '"', ', '
           , '"dateEnd": ', '"', FORMAT(CAST(ro.date_end as datetimeoffset), 'yyyy-MM-ddThh:mm:ss'), '"', ', '
           , '"inspectionPlace": ', '"', ro.inspection_place, '"', ', '
           , '"operatorFullname": ', '"', ro.operator_fullname, '"', ', '
           , '"type": ', '{'
           , '"id": ', dot.id, ', '
           , '"name": ', '"', dot.name, '"', ', '
           , '"mnemo": ', '"', dot.mnemo, '"', '}', ','
           , '"container": ', '{', '"id": ', rc.id, ', '
           , '"height": ', rc.height, ', '
           , '"length": ', rc.length, ', '
           , '"weight": ', rc.weight, ', '
           , '"width": ', rc.width, ', '
           , '"number": ', rc.number, ', '
           , '"isEmpty": ', rc.is_empty, ', '
           , '"dateOfReceipt": ', '"', FORMAT(CAST(rc.date_of_receipt as datetimeoffset), 'yyyy-MM-ddThh:mm:ss'), '"',
              ','
           , '"type": ', '{'
           , '"id": ', dct.id, ', '
           , '"name": ', '"', dct.name, '"', ', '
           , '"mnemo": ', '"', dct.mnemo, '"', '}', '}'
           , '}')
from re_operations ro
         join dbo.re_containers rc on rc.id = ro.container_id
         join dbo.dir_container_types dct on dct.id = rc.type_id
         join dbo.dir_operation_types dot on ro.type_id = dot.id
where rc.id = 3