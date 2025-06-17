@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'On Account Invoices for project Inv Editor'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IE_ProjectOnAccountInv

  as select from ZI_CLP_ProjectOnAccountInvoice as _ProjectOnAccountInvoice
  association [1..1] to ZI_CLP_ProjectBillingDocHdr as _ProjectBillingDocHdr on _ProjectBillingDocHdr.BillingDocument = $projection.BillingDocument
{
  key _ProjectOnAccountInvoice.BillingDocument,
      _ProjectBillingDocHdr.ProjectID,
      _ProjectOnAccountInvoice.BillingDocumentCategory,
      _ProjectOnAccountInvoice.BillingDocumentType,
      _ProjectOnAccountInvoice.BillingDocumentDate,
      _ProjectOnAccountInvoice.BillingDocumentIsCancelled,
      _ProjectOnAccountInvoice.BillingDocumentIsTemporary,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Net Amount before Tax'
      _ProjectOnAccountInvoice.TotalNetAmount,
      _ProjectOnAccountInvoice.TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectOnAccountInvoice.TotalTaxAmount,
      _ProjectOnAccountInvoice.PayerParty,
      _ProjectOnAccountInvoice.CompanyCode,
      _ProjectOnAccountInvoice.FiscalYear,
      _ProjectOnAccountInvoice.AccountingDocument,
      _ProjectOnAccountInvoice.FiscalPeriod,
      _ProjectOnAccountInvoice.SoldToParty,
      _ProjectOnAccountInvoice.PartnerCompany,
      _ProjectOnAccountInvoice.OverallSDProcessStatus,
      _ProjectOnAccountInvoice.OverallBillingStatus,
      _ProjectOnAccountInvoice.AccountingPostingStatus,
      _ProjectOnAccountInvoice.InvoiceClearingStatus,
      _ProjectOnAccountInvoice.YY1_CLPNonStdDelvrDate_BDH,
      _ProjectOnAccountInvoice.YY1_CLPNonStdDelivery_BDH,
      _ProjectOnAccountInvoice.Product,
      /* Associations */
      _ProjectOnAccountInvoice._AccountingDocument,
      _ProjectOnAccountInvoice._AccountingPostingStatus,
      _ProjectOnAccountInvoice._BillingDocumentCategory,
      _ProjectOnAccountInvoice._BillingDocumentType,
      _ProjectOnAccountInvoice._CompanyCode,
      _ProjectOnAccountInvoice._FiscalYear,
      _ProjectOnAccountInvoice._InvoiceClearingStatus,
      _ProjectOnAccountInvoice._OverallBillingStatus,
      _ProjectOnAccountInvoice._OverallSDProcessStatus,
      _ProjectOnAccountInvoice._PayerParty,
      _ProjectOnAccountInvoice._SoldToParty,
      _ProjectOnAccountInvoice._TransactionCurrency,

//      @EndUserText.label: 'Admin Fees'
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      _ProjectOnAccountInvoice.AdminFees,
      //        coalesce(_ProjectOnAccountInvoice.ZAD1AdminFeeDec, 0) +
      //        coalesce(_ProjectOnAccountInvoice.ZAD3AdminFeeDec, 0) as AdminFees,
//      @EndUserText.label: 'Expenses'
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      _ProjectOnAccountInvoice.Expenses,
//      @EndUserText.label: 'Courtesy Discount'
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      _ProjectOnAccountInvoice.CourtesyDiscount,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Total Amount'
      cast( _ProjectOnAccountInvoice.TotalNetAmount  as abap.dec(16,2)) + cast( _ProjectOnAccountInvoice.TotalTaxAmount  as abap.dec(16,2)) as TotalAmount,
      
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Net Amount' 
      (
      cast( _ProjectOnAccountInvoice.TotalNetAmount  as abap.dec(16,2)) -
      coalesce(_ProjectOnAccountInvoice.AdminFees, 0) -
      cast( coalesce(_ProjectOnAccountInvoice.Expenses,0)             as abap.dec(16,2)) +
      coalesce(_ProjectOnAccountInvoice.ZCDSCOURTESYDISCOUNTDEC,0)
      ) as NetAmount,
      
      @EndUserText.label: 'ZAD1 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZAD1AdminFees,
      @EndUserText.label: 'ZAD3 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZAD3AdminFees,
      @EndUserText.label: 'ZADO Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZADOAdminFees,
      @EndUserText.label: 'ZADR Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZADRAdminFees,
      @EndUserText.label: 'ZCDS Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZCDSCourtesyDiscount,
      
            @EndUserText.label: 'Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingDocHdr.ItemAdminFee                                                                                           as AdminFees,
      //      @EndUserText.label: 'Expenses'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast( '0' as abap.dec(16,2) ) as Expenses,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingDocHdr.ItemCourtesyDiscount                                                                                    as CourtesyDiscount,


      @EndUserText.label: 'Total ProfessionalFee'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingDocHdr.TotalProfessionalFee,
      @EndUserText.label: 'Total Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingDocHdr.TotalExpenses,
      @EndUserText.label: 'On Account To Be Utilized'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingDocHdr.OnAccountToBeUtilized,
      @EndUserText.label: 'Time WriteOff'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingDocHdr.TimeWriteOff,
      @EndUserText.label: 'Expenses WriteOff'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _ProjectBillingDocHdr.ExpensesWriteOff,
      
      @EndUserText.label: 'ProfessionalFee'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalProfessionalFee - TimeWriteOff as ProfessionalFee,
      cast( _ProjectBillingDocHdr.TotalProfessionalFee as abap.dec(15,2)) + cast( _ProjectBillingDocHdr.TimeWriteOff  as abap.dec(15,2)) as ProfessionalFee,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalExpenses - ExpensesWriteOff as  Expenses,
      cast( _ProjectBillingDocHdr.TotalExpenses as abap.dec(15,2)) + cast( _ProjectBillingDocHdr.ExpensesWriteOff  as abap.dec(15,2)) as Expenses,

      _ProjectBillingDocHdr
}
where
  _ProjectBillingDocHdr.BillingDocumentType != 'CIC1'
