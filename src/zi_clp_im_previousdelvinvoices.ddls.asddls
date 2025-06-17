@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Previously Delivered Invoices for IM'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_PreviousDelvInvoices
  as select from ZI_CLP_ProjectINV
  association  to parent ZI_CLP_IM_Project            as _IM_Project                 on  _IM_Project.ProjectID = $projection.ProjectID
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
      @EndUserText.label: 'Total Amount'
        @Semantics.amount.currencyCode: 'TransactionCurrency'
        cast(
            case when TotalNetAmount is not null then cast( TotalNetAmount as abap.dec(15,2))  else 0 end +
            case when AdminFees       is not null then cast( AdminFees as abap.dec(15,2))  else 0 end +
            case when Expenses        is not null then cast(  Expenses as abap.dec(15,2)) else 0 end -
            case when CourtesyDiscount is not null then cast( CourtesyDiscount as abap.dec(15,2)) else 0 end
            as abap.dec(16,2)
        ) as TotalAmount,
      /* Associations */
      _IM_Project,
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
where
  Status = 'DLV'
