@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unbilled Scheduled Invoices for Invoice Manager'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_UnbilledScheduledInv
  as select from ZI_CLP_IM_ProjectBillPlanItem
  association [0..1] to I_Customer                   as _Customer                   on  _Customer.Customer = $projection.BillToParty
  association [0..1] to I_AddrCurDefaultEmailAddress as _AddrCurDefaultEmailAddress on  _AddrCurDefaultEmailAddress.AddressID       = $projection.BPAddressID
                                                                                    and _AddrCurDefaultEmailAddress.AddressPersonID = ''

  association  to parent ZI_CLP_IM_Project            as _IM_Project                 on  _IM_Project.ProjectID = $projection.CustomerProject
  association [0..1] to I_BusinessPartner                  as _BusinessPartner               on _BusinessPartner.BusinessPartner = $projection.BillToParty
  //  association [0..1] to ZI_CLP_CommunicationUser_CE  as _CommunicationUser_CE on _CommunicationUser_CE.UserID = $projection.CreatedByUser
{
  key CustomerProject,
  key SalesOrderItem,
  key BillingPlan,
  key BillingPlanItem,
      SalesOrder,
      BillingPlanUsageCategory,
      BillingPlanBillingDate,
      BillingPlanRelatedBillgStatus,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Professional Fees'
      BillingPlanAmount,
      @EndUserText.label: 'Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AdminFees,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Expenses,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CourtesyDiscount,
      
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Total Amount'
      (
      cast(BillingPlanAmount    as abap.dec(16,2)) +
      cast(AdminFees            as abap.dec(16,2)) +
      cast(Expenses             as abap.dec(16,2)) -
      cast(CourtesyDiscount     as abap.dec(16,2))
      )                    as TotalAmount,
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
      case CreatedByUser
      when $session.user then 'Manual Entry'
      else 'EL Scheduled' end as Source,
      CreationDateTime,
      LastChangedByUser,
      LastChangeDateTime,
      WorkPackage,
      WorkPackageName,
      WorkPackageUUID,
      WorkPackageStartDate,
      WorkPackageEndDate,
      BillToParty,
      _Customer.BPCustomerName,
      _Customer.BPCustomerFullName,
      BPAddressID,
      _AddrCurDefaultEmailAddress.EmailAddress,
      WBSElementInternalID,
      /SAP/1_DISTRIBUTIONCHANNEL,
      /SAP/1_ORGANIZATIONDIVISION,
      /SAP/1_SALESORDERTYPE,
      /SAP/1_SALESORGANIZATION,
      /* Associations */
      _BillingPlanRelatedBillgStatus,
      _BillingPlanUsageCategory,
      _SalesOrder,
      _TransactionCurrency,
      _Customer,
      _AddrCurDefaultEmailAddress,
      _IM_Project,      
      _BusinessPartner.IndependentAddressID,
      _BusinessPartner.BusinessPartner,
      _BusinessPartner._BPAddressIndependentEmail
} where BillingPlanItemUsage_2        = '1' 
and BillingPlanRelatedBillgStatus = 'A'
