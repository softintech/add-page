import Ajax, { ajax } from './../../../../libs/ajax'
import { Token, hosts, hostname } from './../../../../libs/config'
import customerTableMock from "./customerTableMock";
import $ from 'jquery'


export async function mockCustomerLib(resove = '') {
  const idapp = localStorage.getItem('idapp');
  let _customerGroup = parseInt(idapp);

  new Promise((r, j) => {
    ajax.Get(`${hosts}/customer/all/${_customerGroup}`, Token, '', r)
  })
    .then((data) => {      
      if (data != false) {
        let da = (data != '' ? JSON.parse(data) : '');
        const das = Object.entries(da).map(([key, value], i) => {
          const id = parseInt(value.id)
          const check_hour = value.check_hour;
          const chk_app = value.chk_app         
          const status = (chk_cancel=='1'
            ?0
            :(chk_app=='1'
              ?1
              :2
              )
          )

          const newData = {
            id,
            check_hour,
            chk_app,
            chk_cancel,            
            status,
          };
          customerTableMock.push(newData)
   
        })
        if (resove != '') {
          resove(das);
        } else {
          return das;
        }
      }
    })



}
export const update = (id, data, userId, r = '') => {

  let obj = {
    action: "tb_customer",
    id: (id==undefined?'':id),
    sql: {
      id_application: {
        val: (data.id_application == "" ? '0' : data.id_application),
        type: 'INTEGER'
      },
      id_position: {
        val: (data.id_position == "" ? '0' : data.id_position),
        type: 'INTEGER'
      },
      id_div: {
        val: (data.id_div == "" ? '0' : data.id_div),
        type: 'INTEGER'
      },
      id_dept: {
        val: (data.id_dept == "" ? '0' : data.id_dept),
        type: 'INTEGER'
      },
      emreq_active: {
        val: data.emreq_active,
        type: 'BOOLEAN'
      }
    }
  }


  const res = new Promise((r, j) => ajax.Post(`${hosts}/customer/update`, Token, obj, r));
  res.then((v) => {

    if (v != false) {
      let obj = {
        id: parseInt(v),
        check_hour: data.check_hour,
        chk_app: data.chk_app,        
        status: data.status
      }
  
      if (r != '') {
        r(obj)
      } else {
        return obj;
      }

    } else {
      if (r != '') {
        r(false)
      } else {
        return false;
      }
    }
  })
}
export const updatedbStatus = (id, status, r = '') => {
  let obj = {
    action: "tb_customer",
    id: id,
    sql: {
      emreq_active: {
        val: status,
        type: 'BOOLEAN'
      }
    }
  }
  const res = new Promise((r, j) => ajax.Post(`${hosts}/customer/update`, Token, obj, r));
  res.then((v) => {
  
    if (v != false) {
      if (r != '') {
        r(true)
      } else {
        return true;
      }

    } else {
      if (r != '') {
        r(false)
      } else {
        return false;
      }
    }
  })
}
export const deletedb = (id, r = '') => {
  let obj = {
    action: "tb_customer",
    id: id
  }
  const res = new Promise((r, j) => ajax.Post(`${hosts}/customer/delete`, Token, obj, r));
  res.then((v) => {

    if (v != false) {
      if (r != '') {
        r(true)
      } else {
        return true;
      }
    } else {
      if (r != '') {
        r(false)
      } else {
        return false;
      }
    }
  })
}

