@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for PBD of Project Inv Finalizer'
@Metadata.ignorePropagatedAnnotations: true
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZC_CLP_IF_PROJECTPBD
  as projection on ZI_CLP_IF_ProjectPBD
{
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
      BillToParty,
      BillingDocumentCategory,
      BillingDocumentType,
      BillingDocumentDate,
      BillingDocumentIsCancelled,
      CancelledBillingDocument,
      AccountingDocument,
      OverallDocumentBillingStatus,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_PrelimBillgDocStatus', element: 'PrelimBillingDocumentStatus'  }}]
      PrelimBillingDocumentStatus,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalNetAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalTaxAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalGrossAmount,
      TransactionCurrency,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_OvrlBillingDocReqStatus', element: 'OverallBillingDocReqStatus'  }}]
      OverallBillingDocReqStatus,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_OverallSDProcessStatus', element: 'OverallSDProcessStatus'  }}]
      OverallSDProcessStatus,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_OverallBillingStatus', element: 'OverallBillingStatus'  }}]
      OverallBillingStatus,
      PricingDocument,
      CompanyCode,
      FiscalYear,
      YY1_CLPNonStdDelvrDate_BDH,
      YY1_CLPNonStdDelivery_BDH,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZI_CLP_DOCAPPROVALSTS_V', element: 'Code'  }}]
      YY1_CLPDocApprovalSts_BDH,
      B2PCustomerName,
      B2PCustomerFullName,
      B2PEmailAddress,
      Status,
      StatusText,
      DateDelivered,
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
      
      @EndUserText.label: 'Total ProfessionalFee'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalProfessionalFee,
      @EndUserText.label: 'Total Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalExpenses,
      @EndUserText.label: 'On Account To Be Utilized'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      OnAccountToBeUtilized,
      @EndUserText.label: 'Time WriteOff'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TimeWriteOff,
      @EndUserText.label: 'Expenses WriteOff'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ExpensesWriteOff,
      
      @EndUserText.label: 'ProfessionalFee'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalProfessionalFee - TimeWriteOff as ProfessionalFee,
      ProfessionalFee,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalExpenses - ExpensesWriteOff as  Expenses,
      Expenses,
      @EndUserText.label: 'Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AdminFees,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CourtesyDiscount,
      BusinessPartner,
      IndependentAddressID,
      /* Associations */
      _BillingDocumentItemBasic,
      _Itemize,
      _Project,
      _UniqueBDWorkPackage,
      _YY1_CLPDocApprovalSts_BDH,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus,
      _BPAddressIndependentEmail
}
