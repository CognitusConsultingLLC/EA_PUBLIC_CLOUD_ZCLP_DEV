@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Previously Del Inv'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_CLP_IM_PreviousDelvInvoices as projection on ZI_CLP_IM_PreviousDelvInvoices
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
      EngManagerTeamMemberUUID,
      EngManagerPersonWorkAgreement,
      EngManagerPersonWorkAgrExtID,
      EngManagerEmailAddress,
      EngManagerPersonFullName,
      BillerTeamMemberUUID,
      BillerPersonWorkAgreement,
      BillerPersonWorkAgrExtID,
      BillerEmailAddress,
      BillerPersonFullName,
      EngPartnerTeamMemberUUID,
      EngPartnerPersonWorkAgreement,
      EngPartnerPersonWorkAgrExtID,
      EngPartnerEmailAddress,
      EngPartnerPersonFullName,
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
      @EndUserText.label: 'Total Amount'
      TotalNetAmount,
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
       @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Admin Fees'
      AdminFees,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Expenses'
      Expenses,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Courtesy Discount'
      CourtesyDiscount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Total Amount'
      TotalAmount,
      /* Associations */
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _IM_Project: redirected to ZC_CLP_IM_PROJECT
}
