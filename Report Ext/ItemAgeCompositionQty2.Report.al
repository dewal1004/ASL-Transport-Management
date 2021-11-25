report 59807 "Item Age Composition - Qty.2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ItemAgeCompositionQty2.rdlc';
    Caption = 'Item Age Composition - Qty.';

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Inventory Posting Group", "Statistics Group", "Location Filter";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Item_TABLECAPTION__________ItemFilter; Item.TableCaption + ': ' + ItemFilter)
            {
            }
            column(PeriodStartDate_2____1; PeriodStartDate[2] + 1)
            {
            }
            column(PeriodStartDate_3__; PeriodStartDate[3])
            {
            }
            column(PeriodStartDate_3____1; PeriodStartDate[3] + 1)
            {
            }
            column(PeriodStartDate_4__; PeriodStartDate[4])
            {
            }
            column(PeriodStartDate_4____1; PeriodStartDate[4] + 1)
            {
            }
            column(PeriodStartDate_5__; PeriodStartDate[5])
            {
            }
            column(Item_Age_Composition___QuantityCaption; Item_Age_Composition___QuantityCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(InvtQty_5_Caption; InvtQty_5_CaptionLbl)
            {
            }
            column(InvtQty_1_Caption; InvtQty_1_CaptionLbl)
            {
            }
            column(Closing_InventoryCaption; Closing_InventoryCaptionLbl)
            {
            }
            column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
            {
            }
            column(Item__No__Caption; Item__No__CaptionLbl)
            {
            }
            column(Item_No_; "No.")
            {
            }
            column(Item_Location_Filter; "Location Filter")
            {
            }
            column(Item_Variant_Filter; "Variant Filter")
            {
            }
            column(Item_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Item_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = FIELD ("No."), "Location Code" = FIELD ("Location Filter"), "Variant Code" = FIELD ("Variant Filter"), "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter");
                DataItemTableView = SORTING ("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date");
                column(InvtQty_1_; InvtQty[1])
                {
                    DecimalPlaces = 0 : 2;
                }
                column(InvtQty_2_; InvtQty[2])
                {
                    DecimalPlaces = 0 : 2;
                }
                column(InvtQty_3_; InvtQty[3])
                {
                    DecimalPlaces = 0 : 2;
                }
                column(InvtQty_4_; InvtQty[4])
                {
                    DecimalPlaces = 0 : 2;
                }
                column(InvtQty_5_; InvtQty[5])
                {
                    DecimalPlaces = 0 : 2;
                }
                column(TotalInvtQty; TotalInvtQty)
                {
                    DecimalPlaces = 0 : 2;
                }
                column(Item_Description; Item.Description)
                {
                }
                column(Item__No__; Item."No.")
                {
                }
                column(Item_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Item_Ledger_Entry_Item_No_; "Item No.")
                {
                }
                column(Item_Ledger_Entry_Location_Code; "Location Code")
                {
                }
                column(Item_Ledger_Entry_Variant_Code; "Variant Code")
                {
                }
                column(Item_Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Item_Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    TotalInvtQty := "Remaining Quantity";

                    for i := 1 to 5 do
                        if ("Posting Date" >= PeriodStartDate[i]) and
                          ("Posting Date" < PeriodStartDate[i + 1])
                        then begin
                            InvtQty[i] := "Remaining Quantity";
                            if InvtQty[i] <> 0 then
                                PrintLine := true;
                        end;
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Drop Shipment", false);
                    CurrReport.CreateTotals(TotalInvtQty, InvtQty);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                PrintLine := false;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control2)
                {
                    ShowCaption = false;
                    field(PeriodLength; PeriodLength)
                    {
                    }
                    label(PrintLine)
                    {
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemFilter := Item.GetFilters;

        PeriodStartDate[6] := 99991231D;
        for i := 1 to 3 do
            PeriodStartDate[5 - i] := CalcDate('-' + PeriodLength, PeriodStartDate[6 - i]);
    end;

    var
        Text001: Label '1M';
        Text002: Label 'Enter the ending date';
        Text003: Label '0D';
        ItemFilter: Text[250];
        InvtQty: array[6] of Decimal;
        PeriodStartDate: array[7] of Date;
        PeriodLength: Code[20];
        i: Integer;
        TotalInvtQty: Decimal;
        PrintLine: Boolean;
        Item_Age_Composition___QuantityCaptionLbl: Label 'Item Age Composition - Quantity';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        InvtQty_5_CaptionLbl: Label 'after...';
        InvtQty_1_CaptionLbl: Label '...before';
        Closing_InventoryCaptionLbl: Label 'Closing Inventory';
        Item_DescriptionCaptionLbl: Label 'Description';
        Item__No__CaptionLbl: Label 'Item No.';
}

