@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Marked WIP for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IE_MarkedWIP
  as select from ZI_CLP_MarkedWIP
{
     @EndUserText.label: 'SAP UUID'
  key SapUuid,

      @EndUserText.label: 'Project Billing Element Entry Item UUID'
      Projbillgelmntentritmuuid,

      @EndUserText.label: 'Project Billing Element UUID'
      Projectbillingelementuuid,

      @EndUserText.label: 'WBS Element Internal ID'
      Wbselementinternalid,

      @EndUserText.label: 'Project ID'
      Project,

      @EndUserText.label: 'Project Billing Request UUID'
      Projectbillingrequestuuid,

      @EndUserText.label: 'Project Billing Request'
      Pbr,

      @EndUserText.label: 'Billing Document Request'
      Bdr,

      @EndUserText.label: 'Prelim Billing Document'
      Pbd,

      @EndUserText.label: 'Invoice Number'
      Invoice,

      @EndUserText.label: 'Status'
      Status,

      @EndUserText.label: 'Project ID'
      ProjectID,

      @EndUserText.label: 'Project Billing Element Entry Source Type'
      ProjBillgElmntEntrSourceType,

      @EndUserText.label: 'Material'
      Material,

      @EndUserText.label: 'Quantity Unit'
      QuantityUnit,

      @EndUserText.label: 'Is Project Billing Element Entry Cancelled'
      ProjBillgElmntEntrIsCancelled,

      @EndUserText.label: 'Pricing Date'
      PricingDate,

      @EndUserText.label: 'Net Price Amount Is Manual'
      NetPriceAmountIsManual,

      @EndUserText.label: 'Transaction Currency'
      TransactionCurrency,

      @EndUserText.label: 'Project Currency'
      ProjectCurrency,

      @EndUserText.label: 'Global Currency'
      GlobalCurrency,

      @EndUserText.label: 'Document Currency'
      DocumentCurrency,

      @EndUserText.label: 'Services Rendered Date'
      ServicesRenderedDate,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'Original Total Quantity'
      OriginalTotalQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Original Amount in Transaction Currency'
      OriginalAmountInTransacCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'Original Amount in Project Currency'
      OriginalAmountInProjectCrcy,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'Original Amount in Global Currency'
      OriginalAmountInGlobalCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'Open Quantity'
      OpenQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Open Amount in Transaction Currency'
      OpenAmountInTransCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'Open Amount in Project Currency'
      OpenAmountInProjectCurrency,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'Open Amount in Global Currency'
      OpenAmountInGlobalCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'To Be Billed Quantity'
      ToBeBilledQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'To Be Billed Amount in Transaction Currency'
      ToBeBilledAmtInTransCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'To Be Billed Amount in Project Currency'
      ToBeBilledAmtInProjCurrency,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'To Be Billed Amount in Global Currency'
      ToBeBilledAmtInGlobCurrency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'To Be Written Off Quantity'
      ToBeWrittenOffQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'To Be Written Off Amount in Transaction Currency'
      ToBeWrittenOffAmtInTransCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'To Be Written Off Amount in Project Currency'
      ToBeWrittenOffAmtInProjectCrcy,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'To Be Written Off Amount in Global Currency'
      ToBeWrittenOffAmtInGlobalCrcy,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      @EndUserText.label: 'To Be Postponed Quantity'
      ToBePostponedQuantity,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'To Be Postponed Amount in Transaction Currency'
      ToBePostponedAmtInTransacCrcy,

      @Semantics.amount.currencyCode: 'ProjectCurrency'
      @EndUserText.label: 'To Be Postponed Amount in Project Currency'
      ToBePostponedAmtInProjectCrcy,

      @Semantics.amount.currencyCode: 'GlobalCurrency'
      @EndUserText.label: 'To Be Postponed Amount in Global Currency'
      ToBePostponedAmtInGlobalCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Billable Revenue Amount in Document Currency'
      BillableRevenueAmtInDocCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Manual Net Price Amount in Document Currency'
      ManualNetPriceAmtInDocCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Net Price Amount in Document Currency'
      NetPriceAmountInDocCrcy,

      @Semantics.quantity.unitOfMeasure: 'NetPriceQuantityUnit'
      @EndUserText.label: 'Net Price Quantity'
      NetPriceQuantity,

      @EndUserText.label: 'Net Price Quantity Unit'
      NetPriceQuantityUnit,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Original Revenue Amount in Document Currency'
      OriginalRevenueAmtInDocCrcy,

      @Semantics.amount.currencyCode: 'DocumentCurrency'
      @EndUserText.label: 'Open Revenue Amount in Document Currency'
      OpenRevenueAmtInDocCrcy,

      @EndUserText.label: 'Project Billing Element Entry Is Reversed'
      ProjBillgElmntEntrIsReversed,

      @EndUserText.label: 'Project Billing Element Entry Is Reversal'
      ProjBillgElmntEntrIsReversal,

      @EndUserText.label: 'Cancellation Source Code'
      PrjBlgElmEntrCanclnSrceCode,

      @EndUserText.label: 'Created By User'
      PrjBlgElmEntrCreatedByUser,

      @EndUserText.label: 'Created At Date Time'
      PrjBlgElmEntrCreatedAtDteTme,

      @EndUserText.label: 'Last Changed By User'
      PrjBlgElmEntrLastChgdByUser,

      @EndUserText.label: 'Last Changed At Date Time'
      PrjBlgElmEntrLastChgdAtDteTme,

      @EndUserText.label: 'Project Billing Element Entry Long Text'
      PrjBlgElmEntryLongText,

      @EndUserText.label: 'Project Billing Element Entry Description'
      ProjectBillingElementEntryDesc,

      @EndUserText.label: 'Transferred Cost Quantity Code'
      ProjBillgTransfCostQtyCode,

      @EndUserText.label: 'Item Value Is Not Actual Cost'
      ProjBillgItmValIsNotActualCost,

      @EndUserText.label: 'Project Billing Element Entry Object'
      ProjBillgElementEntryObject,

      @EndUserText.label: 'Posting Date'
      PostingDate,

      @EndUserText.label: 'Project Internal ID'
      ProjectInternalID,

      @EndUserText.label: 'Project External ID'
      ProjectExternalID,

      @EndUserText.label: 'Project Description'
      ProjectDescription,

      @EndUserText.label: 'WBS Description'
      WBSDescription,

      @EndUserText.label: 'WBS Element External ID'
      WBSElementExternalID,

      @EndUserText.label: 'Project Billing Element Entry Item UUID'
      ProjBillgElmntEntrItmUUID_1,

      @EndUserText.label: 'Reference Document'
      ReferenceDocument,

      @EndUserText.label: 'Reversal Reference Document'
      ReversalReferenceDocument,

      @EndUserText.label: 'Accounting Document'
      AccountingDocument,

      @EndUserText.label: 'Ledger GL Line Item'
      LedgerGLLineItem,

      @EndUserText.label: 'Billing Plan'
      BillingPlan,

      @EndUserText.label: 'Billing Plan Item'
      BillingPlanItem,

      @EndUserText.label: 'Project Element UUID'
      ProjectElementUUID,

      @EndUserText.label: 'Sales Document'
      SalesDocument,

      @EndUserText.label: 'Sales Document Item'
      SalesDocumentItem,

      @EndUserText.label: 'Billing WBS Element Internal ID'
      BillingWBSElementInternalID,

      @EndUserText.label: 'SD Document Category'
      SDDocumentCategory,

      @EndUserText.label: 'Ledger'
      Ledger,

      @EndUserText.label: 'Company Code'
      CompanyCode,

      @EndUserText.label: 'Fiscal Year'
      FiscalYear,

      @EndUserText.label: 'Reference Document (GL Line Item)'
      ReferenceDocument_1,

      @EndUserText.label: 'Work Item'
      WorkItem,

      @EndUserText.label: 'Work Package'
      WorkPackage,

      @EndUserText.label: 'Bill-To Party'
      BillToParty,

      @EndUserText.label: 'Ship-To Party'
      ShipToParty,

      @EndUserText.label: 'Personnel Number'
      PersonnelNumber,

      @EndUserText.label: 'Document Date'
      DocumentDate,
      
      PersonFullName,
      ProductName,

      @EndUserText.label: 'Accounting Document (Reversal Link)'
      _AccountingDocument,

      @EndUserText.label: 'SD Document Category Text'
      _Text,

      @EndUserText.label: 'Company Code (Link)'
      _CompanyCode,

      @EndUserText.label: 'Fiscal Year (Link)'
      _FiscalYear,

      _DocumentCurrency,
      _DocumentCurrencyText,
      _GlobalCurrency,
      _GlobalCurrencyText,
      _Material,
      _PrjBillgTransfCostQtyCodeTxt,
      _PrjBlgElmEntrCanclnSrcCdText,
      _PrjBlgElmEntrCanclnSrceCode,
      _PrjBlgElmEntrSrceTypeText,
      _ProjBillgElmntEntrSourceType,
      _ProjBillgTransfCostQtyCode,
      _ProjectCurrency,
      _ProjectCurrencyText,
      _QuantityUnit,
      _TransactionCurrency,
      _TransactionCurrencyText,
      _CustProjBillElemEntry

}
