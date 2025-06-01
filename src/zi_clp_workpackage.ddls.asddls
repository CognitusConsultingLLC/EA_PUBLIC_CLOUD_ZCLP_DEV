@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project Work Package'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_Workpackage as select from I_EnterpriseProjectElement
{
    key ProjectElementUUID,
    ProjectElement as WorkPackageID,
    ProjectUUID,
    ProjectElementDescription as WorkPackageName,
    _Project.Project as ProjectID,
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
//    FunctionalLocation,
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
}
