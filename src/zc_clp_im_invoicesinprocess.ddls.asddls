@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Invoices in Process'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_CLP_IM_InvoicesInProcess as projection on ZI_CLP_IM_InvoicesInProcess
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
    /* Associations */
    _BillingDocumentItemBasic,
    _UniqueBDWorkPackage,
    _IM_Project: redirected to ZC_CLP_IM_PROJECT
}
