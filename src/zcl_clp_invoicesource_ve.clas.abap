CLASS zcl_clp_invoicesource_ve DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_communication_user_id
      RETURNING VALUE(rv_user_id) TYPE syuname.
    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clp_invoicesource_ve IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    CHECK NOT it_original_data IS INITIAL.

    DATA : lt_calculated_data TYPE STANDARD TABLE OF ZC_CLP_IM_UnbilledScheduledInv WITH DEFAULT KEY.

    MOVE-CORRESPONDING it_original_data TO lt_calculated_data.
*
    DATA(lv_manualUser) =  get_communication_user_id( ).
*    'CC0000000025'
    LOOP AT lt_calculated_data ASSIGNING FIELD-SYMBOL(<Item>).
      IF  <Item>-CreatedByUser EQ lv_manualUser .
        <Item>-Source = 'Manual'.
      ELSE.
        <Item>-Source = 'Scheduled'.
      ENDIF.
    ENDLOOP.
*
    MOVE-CORRESPONDING lt_calculated_data TO ct_calculated_data.

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.

  METHOD get_communication_user_id.


***    TYPES: BEGIN OF ty_result,
***             UserID TYPE syuname,
***           END OF ty_result.
***
***    TYPES: ty_result_tab TYPE STANDARD TABLE OF ty_result WITH EMPTY KEY.
***
***    TYPES: BEGIN OF ty_d,
***             results TYPE ty_result_tab,
***           END OF ty_d.
***
***    TYPES: BEGIN OF ty_response,
***             d TYPE ty_d,
***           END OF ty_response.
***
***    DATA: lv_path          TYPE string,
***          lv_json_response TYPE string,
***          lv_user_id       TYPE syuname,
***          lo_client        TYPE REF TO if_web_http_client,
***          lo_request       TYPE REF TO if_web_http_request,
***          lo_response      TYPE REF TO if_web_http_response,
***          lt_data          TYPE ty_response.
***
***    " Define relative path
***    lv_path = |/sap/opu/odata4/sap/aps_com_api_cusr_read/srvd_a2x/sap/communicationuser/0001/CommunicationUser?$filter=UserName eq 'INTERNAL_USER_CLP'|.
***
***
***    DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
***
**** Find CA by Scenario ID
***    lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'SAP_COM_0A05' ) ).
***    DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
***    lo_factory->query_ca(
***      EXPORTING
***        is_query           = VALUE #( cscn_id_range = lr_cscn )
***      IMPORTING
***        et_com_arrangement = DATA(lt_ca) ).
***
***    IF lt_ca IS INITIAL.
***      EXIT.
***    ENDIF.
***
**** take the first one
***    READ TABLE lt_ca INTO DATA(lo_ca) INDEX 1.
***
****    READ TABLE lt_ca INTO DATA(lo_ca) with key comm_scenario_id = 'SAP_COM_0A05_CLP'.
***    LOOP AT lt_ca ASSIGNING FIELD-SYMBOL(<lfs_ca>).
***        if <lfs_ca>->get_name( ) = 'SAP_COM_0A05_CLP'.
***            lo_ca = <lfs_ca>.
***            exit.
***        ENDIF.
***    ENDLOOP.
***
**** get destination based on Communication Arrangement and the service ID
***    TRY.
***
***        DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
***                                             comm_scenario  = 'SAP_COM_0A05'
***                                             service_id     = 'APS_COM_API_CUSR_READ_G4BA' ).
****        DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
****            comm_scenario  = 'SAP_COM_0A05'
****            service_id     = 'APS_COM_API_CUSR_READ_G4BA'
****            comm_system_id = lo_ca->get_comm_system_id( ) ).
***
***      CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
***        EXIT.
***    ENDTRY.
***
****  " Create client using Communication Arrangement target
****  TRY.
****      lo_client = cl_web_http_client_provider=>create_by_com_target(
****                    communication_target = lo_ca->get_comm_
****                    i_path = lv_path ).
****    CATCH cx_web_http_client_error INTO DATA(lx_client).
****      RETURN. " Handle error if needed
****  ENDTRY.
***
***    " Get request/response
***    lo_request = lo_client->get_http_request( ).
***    lo_request->set_header_field( i_name = 'Accept' i_value = 'application/json' ).
***
***    TRY.
***        lo_client->execute( i_method = if_web_http_client=>get ).
***        lo_request = lo_client->get_http_request( ).
***      CATCH cx_web_http_client_error INTO DATA(lx_exec).
***        RETURN.
***    ENDTRY.
***
***    " Get response as string
***    lv_json_response = lo_response->get_text( ).
***
***    " Deserialize JSON (expects {"d":{"results":[{"UserID":"CC0000000025"}]}})
***    TRY.
***        CALL METHOD /ui2/cl_json=>deserialize
***          EXPORTING
***            json = lv_json_response
***          CHANGING
***            data = lt_data.
***
***        lv_user_id = lt_data-d-results[ 1 ]-UserID.
***        rv_user_id = lv_user_id.
***      CATCH cx_root.
***        RETURN.
***    ENDTRY.

  ENDMETHOD.

ENDCLASS.
