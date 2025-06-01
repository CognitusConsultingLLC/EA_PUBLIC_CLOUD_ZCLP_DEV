@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'WorkPackages for IE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IE_Workpackage
 as select from ZI_CLP_Workpackage
{
    key ProjectElementUUID,
    WorkPackageID,
    ProjectUUID,
    WorkPackageName,
    ProjectID,
    ProcessingStatus,
    PlannedStartDate,
    PlannedEndDate,
    ActualStartDate,
    ActualFinishDate,
    SortingNumber,
    EntProjectElementType,
    IsProjectMilestone,
    ForecastedEndDate,
    MilestoneApprovalStatus,
    IsMainMilestone,
    TaxJurisdiction,
    WBSElementIsBillingElement,
    WBSElementInternalID,
    ProjectInternalID,
    ParentObjectUUID,
    ProjectElementOrdinalNumber,
    WBSIsStatisticalWBSElement,
    CompanyCode,
    ControllingArea,
    CostCenter,
    CostingSheet,
    FactoryCalendar,
    FunctionalArea,
    InvestmentProfile,
    Location,
    Plant,
    ProfitCenter,
    ResponsibleCostCenter,
    ResultAnalysisInternalID,
    LeadingSalesOrder,
    LeadingSalesOrderItem,
    CreatedByUser,
    CreationDateTime,
    LastChangedByUser,
    LastChangeDateTime,
    HierarchyNodeUUID,
    /* Associations */
    _AuthGroup,
    _AuthRole,
    _AuthSubst,
    _AuthUser,
    _EnterpriseProjectForUser,
    _EntProjElmntDlvbrl,
    _Project
} where WBSElementIsBillingElement = ''
and ProjectElementOrdinalNumber != 0
