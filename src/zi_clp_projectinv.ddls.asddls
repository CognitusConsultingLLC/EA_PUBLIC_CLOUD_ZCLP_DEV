@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoices for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectINV
  as select from ZI_CLP_ProjectBillingDocHdr
  association [0..1] to I_Customer                  as _I_Customer               on _I_Customer.Customer = $projection.BillToParty
  association [0..*] to ZI_CLP_BillingDoctItemBasic as _BillingDocumentItemBasic on _BillingDocumentItemBasic.BillingDocument = $projection.BillingDocument
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
      PrelimBillingDocumentStatus,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
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
      AccountingTransferStatus,
      PricingDocument,
      CompanyCode,
      FiscalYear,
      YY1_CLPNonStdDelvrDate_BDH,
      YY1_CLPNonStdDelivery_BDH,
      YY1_CLPDocApprovalSts_BDH,

      @EndUserText.label: 'Bill-To-Party Customer Name'
      _I_Customer.BPCustomerName                                                                              as B2PCustomerName,

      @EndUserText.label: 'Bill-To-Party Customer Full Name'
      _I_Customer.BPCustomerFullName                                                                          as B2PCustomerFullName,

      @EndUserText.label: 'Bill-To-Party Email Address'
      _I_Customer._AddressDefaultRepresentation._CurrentDfltEmailAddress.EmailAddress                         as B2PEmailAddress,

      @EndUserText.label: 'Status'
      case
      when  ( YY1_CLPNonStdDelivery_BDH = 'X' and YY1_CLPNonStdDelvrDate_BDH = '00000000'  ) then 'AWD'
      when  ( OverallBillingStatus = 'B' and AccountingTransferStatus = 'A' ) then 'TBP'
      when ( ( YY1_CLPNonStdDelivery_BDH = 'X'  and YY1_CLPNonStdDelvrDate_BDH is not null )
      or ( OverallBillingStatus = 'A'  and YY1_CLPNonStdDelivery_BDH = '' )
      ) then 'DLV'
      else ''
      end                                                                                                     as Status,
      @EndUserText.label: 'Status Text'
      case
      when  ( YY1_CLPNonStdDelivery_BDH = 'X' and YY1_CLPNonStdDelvrDate_BDH = '00000000'  ) then 'Pending Manual Delivery'
      when  ( OverallBillingStatus = 'B' and AccountingTransferStatus = 'A' ) then 'To Be Posted'
      when ( ( YY1_CLPNonStdDelivery_BDH = 'X'  and YY1_CLPNonStdDelvrDate_BDH is not null )
          or ( OverallBillingStatus = 'A'  and YY1_CLPNonStdDelivery_BDH = '' )
          ) then 'Delivered'
      else ''
      end                                                                                                     as StatusText,

      @EndUserText.label: 'Date Delivered'
      case  when YY1_CLPNonStdDelivery_BDH = 'X' then YY1_CLPNonStdDelvrDate_BDH else BillingDocumentDate end as DateDelivered,

      //      @EndUserText.label: 'Admin Fees'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast(TotalNetAmount as abap.dec(16,2)) * cast( '0.05' as abap.dec(16,2) ) as AdminFees,
      //      @EndUserText.label: 'Expenses'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast( '0' as abap.dec(16,2) ) as Expenses,
      //      @EndUserText.label: 'Courtesy Discount'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast( '0' as abap.dec(16,2) ) as CourtesyDiscount,


      @EndUserText.label: 'ZAD1 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZAD1AdminFees,
      @EndUserText.label: 'ZADO Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZADOAdminFees,
      @EndUserText.label: 'ZADR Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZADRAdminFees,


      @EndUserText.label: 'Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZAD3AdminFees                                                                                           as AdminFees,
      //      @EndUserText.label: 'Expenses'
      //      @Semantics.amount.currencyCode: 'TransactionCurrency'
      //      cast( '0' as abap.dec(16,2) ) as Expenses,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZCDSCourtesyDiscount                                                                                    as CourtesyDiscount,


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
      cast( TotalProfessionalFee as abap.dec(15,2)) + cast( TimeWriteOff  as abap.dec(15,2)) as ProfessionalFee,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalExpenses - ExpensesWriteOff as  Expenses,
      cast( TotalExpenses as abap.dec(15,2)) + cast( ExpensesWriteOff  as abap.dec(15,2)) as Expenses,
      
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus

}
where
  SDDocumentCategory = 'M'
