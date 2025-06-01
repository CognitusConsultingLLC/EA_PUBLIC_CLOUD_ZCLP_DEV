@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Unbilled Sch. Inv'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_CLP_IM_UnbilledScheduledInv
  as projection on ZI_CLP_IM_UnbilledScheduledInv
{
  key CustomerProject,
  key SalesOrderItem,
  key BillingPlan,
  key BillingPlanItem,
      SalesOrder,
      BillingPlanUsageCategory,
      @EndUserText.label: 'Scheduled Date'
      BillingPlanBillingDate,
      BillingPlanRelatedBillgStatus,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Professional Fees'
      BillingPlanAmount,
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
      TransactionCurrency,
      PostponementReason,
      BillingPlanItemUsage_2,
      BillingPlanItemDescription,
      BillingPlanServiceStartDate,
      BillingPlanServiceEndDate,
      SalesOrderType,
      OrganizationDivision,
      SalesOrganization,
      DistributionChannel,
      CreatedByUser,
      //    @ObjectModel.virtualElementCalculatedBy:'ABAP:ZCL_CLP_INVOICESOURCE_VE' 
      //    virtual Source : abap.char( 15 ),
      @EndUserText.label: 'Source'
      Source,
      CreationDateTime,
      LastChangedByUser,
      LastChangeDateTime,
      
      @EndUserText.label: 'Work Package'
      WorkPackage,
      @EndUserText.label: 'WP Description'
      WorkPackageName,
      WorkPackageUUID,
      WorkPackageStartDate,
      WorkPackageEndDate,
      @EndUserText.label: 'Bill To Party'
      BillToParty,
      BPCustomerName,
      BPCustomerFullName,
      BPAddressID,
      @EndUserText.label: 'Recipient'
      EmailAddress,
      WBSElementInternalID,
      /SAP/1_DISTRIBUTIONCHANNEL,
      /SAP/1_ORGANIZATIONDIVISION,
      /SAP/1_SALESORDERTYPE,
      /SAP/1_SALESORGANIZATION,
      /* Associations */
      _AddrCurDefaultEmailAddress,
      _BillingPlanRelatedBillgStatus,
      _BillingPlanUsageCategory,
      _Customer,
      _SalesOrder,
      _TransactionCurrency,
      _IM_Project: redirected to parent ZC_CLP_IM_PROJECT

}
