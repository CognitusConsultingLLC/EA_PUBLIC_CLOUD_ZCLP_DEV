@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TCLP_INV_P_HDR
  as select from ztclp_inv_p_hdr 
  composition [0..*] of ZR_TCLP_INV_P_ITM as _InvProcessItems
{
  key invoice_process_id           as InvoiceProcessId,
      project_id                   as ProjectId,
      invoice_date                 as InvoiceDate,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      transaction_currency         as TransactionCurrency,
      mark_oa                      as MarkOa,
      reli_wip                     as ReliWip,
      final_inv                    as FinalInv,
      out_source_sl                as OutSourceSl,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      invoice_inp_fee_value        as InvoiceInpFeeValue,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      invoice_inp_admin_fee_value  as InvoiceInpAdminFeeValue,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      invoice_inp_expense_value    as InvoiceInpExpenseValue,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      invoice_inp_courtesy_disc    as InvoiceInpCourtesyDisc,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      invoice_inp_prior_acc_amount as InvoiceInpPriorAccAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      total_invoice_amt            as TotalInvoiceAmt,
      pbd                          as Pbd,
      invoice                      as Invoice,
      status                       as Status,
      message                      as Message,
      @Semantics.user.createdBy: true
      created_by                   as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_on                   as CreatedOn,
      @Semantics.user.lastChangedBy: true
      last_changed_by              as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_on              as LastChangedOn,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed           as LocalLastChanged
      ,
      
      _InvProcessItems

}
