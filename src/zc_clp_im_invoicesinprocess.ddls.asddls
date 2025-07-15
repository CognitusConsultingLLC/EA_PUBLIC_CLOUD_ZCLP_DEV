@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Invoices in Process'
@Metadata.ignorePropagatedAnnotations: true
@Consumption.dbHints: ['USE_HEX_PLAN']
define view entity ZC_CLP_IM_InvoicesInProcess
  as projection on ZI_CLP_IM_InvoicesInProcess
{
      @EndUserText.label: 'Document Number'
  key BillingDocument,
      ProjectID,
      SDDocumentCategory,
      ProjectUUID,
      ManagerTeamMemberUUID,
      ManagerPersonWorkAgreement,
      ManagerPersonWorkAgrExtID,
      ManagerEmailAddress,
      ManagerPersonFullName,
      ManagerBP,
      ManagerBPUUID,
      EngManagerTeamMemberUUID,
      EngManagerPersonWorkAgreement,
      EngManagerPersonWorkAgrExtID,
      EngManagerEmailAddress,
      EngManagerPersonFullName,
      EngManagerBP,
      EngManagerBPUUID,
      BillerTeamMemberUUID,
      BillerPersonWorkAgreement,
      BillerPersonWorkAgrExtID,
      BillerEmailAddress,
      BillerPersonFullName,
      BillerBP,
      BillerBPUUID,
      EngPartnerTeamMemberUUID,
      EngPartnerPersonWorkAgreement,
      EngPartnerPersonWorkAgrExtID,
      EngPartnerEmailAddress,
      EngPartnerPersonFullName,
      EngPartnerBP,
      EngPartnerBPUUID,
      Customer,
      CustomerName,
      @EndUserText.label: 'Bill To Party'
      BillToParty,
      BillingDocumentCategory,
      BillingDocumentType,
      BillingDocumentDate,
      BillingDocumentIsCancelled,
      CancelledBillingDocument,
      AccountingDocument,
      OverallDocumentBillingStatus,
      PrelimBillingDocumentStatus,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Total Net Amount'
      TotalNetAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalTaxAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Total Gross Amount'
      TotalGrossAmount,
      TransactionCurrency,
      OverallBillingDocReqStatus,
      OverallSDProcessStatus,
      OverallBillingStatus,
      PricingDocument,
      CompanyCode,
      FiscalYear,
      YY1_CLPNonStdDelvrDate_BDH,
      YY1_CLPNonStdDelivery_BDH,
      YY1_CLPDocApprovalSts_BDH,
      B2PCustomerName,
      B2PCustomerFullName,
      @EndUserText.label: 'Recipient'
      B2PEmailAddress,
      @EndUserText.label: 'Status'
      Status,
      @EndUserText.label: 'Status Text'
      StatusText,
      DateDelivered,
      @EndUserText.label: 'Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AdminFees,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Expenses,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CourtesyDiscount,      
      @EndUserText.label: 'ProfessionalFee'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ProfessionalFee,      
      @EndUserText.label: 'On Account To Be Utilized'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      OnAccountToBeUtilized,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Total Amount'
      TotalAmount,
      /* Associations */
      _IM_Project : redirected to ZC_CLP_IM_PROJECT,
      
      
      IndependentAddressID,
      BusinessPartner,
      
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus,
      _BPAddressIndependentEmail
}
