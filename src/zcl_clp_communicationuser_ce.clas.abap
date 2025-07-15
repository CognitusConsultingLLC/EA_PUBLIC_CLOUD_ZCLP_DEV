CLASS zcl_clp_communicationuser_ce DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLP_COMMUNICATIONUSER_CE IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA:lv_total_number_of_results TYPE int8,
         lt_query_results1          TYPE STANDARD TABLE OF ZI_CLP_CommunicationUser_CE.





*&------------------------------------------------------------------------------*
*& paging & sorting related logic is needed by default else Odata throws error!
*&------------------------------------------------------------------------------*

    DATA(lv_top)     = io_request->get_paging( )->get_page_size( ).
    IF lv_top < 0.
      lv_top = 1.
    ENDIF.

    DATA(lv_skip)    = io_request->get_paging( )->get_offset( ).

    DATA(lt_sort)    = io_request->get_sort_elements( ).

    DATA : lv_orderby TYPE string.
    LOOP AT lt_sort INTO DATA(ls_sort).
      IF ls_sort-descending = abap_true.
        lv_orderby = |'{ lv_orderby } { ls_sort-element_name } DESCENDING '|.
      ELSE.
        lv_orderby = |'{ lv_orderby } { ls_sort-element_name } ASCENDING '|.
      ENDIF.
    ENDLOOP.


    DATA(lt_sort_elements) = io_request->get_sort_elements( ).
    IF lt_sort_elements IS NOT INITIAL.
      SORT lt_query_results1 BY CORRESPONDING abap_sortorder_tab( lt_sort_elements MAPPING name = element_name ).
    ENDIF.

    lv_total_number_of_results = lines( lt_query_results1 ).

    IF io_request->get_paging( )->get_page_size( ) <> if_rap_query_paging=>page_size_unlimited.
      DATA(lv_from_row) = io_request->get_paging( )->get_offset( ) .
      DATA(lv_to_row) = lv_from_row + io_request->get_paging( )->get_page_size( ) + 1.
      DELETE lt_query_results1 FROM lv_to_row.
      IF lv_from_row > 1.
        DELETE lt_query_results1 FROM 1 TO lv_from_row.
      ENDIF.
    ENDIF.



*    lv_total_number_of_results = lines( lt_query_results1 ).
    io_response->set_total_number_of_records( lv_total_number_of_results ).
    io_response->set_data( lt_query_results1 ).

  ENDMETHOD.
ENDCLASS.
