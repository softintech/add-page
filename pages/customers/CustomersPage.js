import React from "react";
import { Route } from "react-router-dom";
import { CustomersLoadingDialog } from "./customers-loading-dialog/CustomersLoadingDialog";
import { CustomerEditDialog } from "./customer-edit-dialog/CustomerEditDialog";
import { CustomerDeleteDialog } from "./customer-delete-dialog/CustomerDeleteDialog";
import { CustomersDeleteDialog } from "./customers-delete-dialog/CustomersDeleteDialog";
import { CustomersFetchDialog } from "./customers-fetch-dialog/CustomersFetchDialog";
import { CustomersUpdateStateDialog } from "./customers-update-status-dialog/CustomersUpdateStateDialog";
import { CustomersUIProvider } from "./CustomersUIContext";
import { CustomersCard } from "./CustomersCard";

export function CustomersPage({ history }) {
   
  const pages = "/"+(history.location.pathname.split('/'))[1]+"/"+(history.location.pathname.split('/'))[2];
  const customersUIEvents = {
    newCustomerButtonClick: () => {
      history.push(`${pages}/new`);
    },
    openEditCustomerDialog: (id) => {
      history.push(`${pages}/${id}/edit`);
    },
    openDeleteCustomerDialog: (id) => {     
      history.push(`${pages}/${id}/delete`);
    },
    openDeleteCustomersDialog: () => {
      history.push(`${pages}/deleteCustomers`);
    },
    openFetchCustomersDialog: () => {
      history.push(`${pages}/fetch`);
    },
    openUpdateCustomersStatusDialog: () => {
      history.push(`${pages}/updateStatus`);
    }
  }

  return (
    <CustomersUIProvider customersUIEvents={customersUIEvents}>
      <CustomersLoadingDialog />
      <Route path={`${pages}/new`}>
        {({ history, match }) => (
          <CustomerEditDialog
            show={match != null}
            onHide={() => {
              history.push(pages);
            }}
          />
        )}
      </Route>     
      <Route path={`${pages}/deleteCustomers`}>
        {({ history, match }) => (
          <CustomersDeleteDialog
            show={match != null}
            onHide={() => {
              history.push(pages);
            }}
          />
        )}
      </Route>
      <Route path={`${pages}/:id/delete`}>
        {({ history, match }) => (
          <CustomerDeleteDialog
            show={match != null}
            id={match && match.params.id}
            onHide={() => {
              history.push(pages);
            }}
          />
        )}
      </Route>
      <Route path={`${pages}/fetch`}>
        {({ history, match }) => (
          <CustomersFetchDialog
            show={match != null}
            onHide={() => {
              history.push(pages);
            }}
          />
        )}
      </Route>
      <Route path={`${pages}/updateStatus`}>
        {({ history, match }) => (
          <CustomersUpdateStateDialog
            show={match != null}
            onHide={() => {
              history.push(pages);
            }}
          />
        )}
      </Route>
      <CustomersCard/>
    </CustomersUIProvider>
  );
}
