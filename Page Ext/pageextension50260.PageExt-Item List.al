pageextension 50260 pageextension50260 extends "Item List"
{
    layout
    {
        modify("Production BOM No.")
        {
            Visible = false;
        }
        modify("Routing No.")
        {
            Visible = false;
        }
        addafter("No.")
        {
            field("No. 2"; "No. 2")
            {
                Visible = false;
            }
        }
        addafter("Default Deferral Template Code")
        {
            field("Statistics Group"; "Statistics Group")
            {
            }
            field(Reserve; Reserve)
            {
                Visible = false;
            }
            field("SF Cat"; "SF Cat")
            {
            }
            field("Country/Region Purchased Code"; "Country/Region Purchased Code")
            {
                Visible = false;
            }
            field(Points; Points)
            {
                Visible = false;
            }
            field("Duty Rate%"; "Duty Rate%")
            {
                Visible = false;
            }
            field("Order Multiple"; "Order Multiple")
            {
                Visible = false;
            }
            field("CRM / STR"; "CRM / STR")
            {
            }
            field("Reorder Point"; "Reorder Point")
            {
                Visible = false;
            }
            field("Reorder Quantity"; "Reorder Quantity")
            {
                Visible = false;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Level) on "Item(Action 64)".


        //Unsupported feature: Property Modification (Level) on ""&Units of Measure"(Action 25)".


        //Unsupported feature: Property Modification (Level) on "Attributes(Action 137)".


        //Unsupported feature: Property Modification (Level) on "FilterByAttributes(Action 138)".


        //Unsupported feature: Property Modification (Level) on "ClearAttributes(Action 139)".


        //Unsupported feature: Property Modification (Level) on ""Va&riants"(Action 30)".


        //Unsupported feature: Property Modification (Level) on ""Substituti&ons"(Action 500)".


        //Unsupported feature: Property Modification (Level) on "Identifiers(Action 121)".


        //Unsupported feature: Property Modification (Level) on ""Cross Re&ferences"(Action 82)".


        //Unsupported feature: Property Modification (Level) on ""E&xtended Texts"(Action 28)".


        //Unsupported feature: Property Modification (Level) on "Translations(Action 27)".


        //Unsupported feature: Property Modification (Level) on "Action145(Action 145)".


        //Unsupported feature: Property Modification (Level) on "AdjustInventory(Action 90)".


        //Unsupported feature: Property Modification (Level) on "Dimensions(Action 94)".


        //Unsupported feature: Property Modification (Level) on "DimensionsSingle(Action 184)".


        //Unsupported feature: Property Modification (Level) on "DimensionsMultiple(Action 93)".


        //Unsupported feature: Property Modification (Name) on ""Revaluation Journal"(Action 119)".

        modify(SendApprovalRequest)
        {

            //Unsupported feature: Property Modification (Name) on "SendApprovalRequest(Action 87)".

            Caption = 'Revaluation Journal';

            //Unsupported feature: Property Modification (Image) on "SendApprovalRequest(Action 87)".


            //Unsupported feature: Property Insertion (RunObject) on "SendApprovalRequest(Action 87)".

        }
        modify(CancelApprovalRequest)
        {

            //Unsupported feature: Property Modification (Name) on "CancelApprovalRequest(Action 86)".

            Caption = 'Phys. Inventory Journal';

            //Unsupported feature: Property Insertion (RunObject) on "CancelApprovalRequest(Action 86)".

        }

        //Unsupported feature: Property Modification (Level) on ""Requisition Worksheet"(Action 1905370404)".


        //Unsupported feature: Property Modification (Level) on ""Item Journal"(Action 1904344904)".


        //Unsupported feature: Property Modification (Level) on ""Item Reclassification Journal"(Action 1906716204)".


        //Unsupported feature: Property Modification (Level) on ""Item Tracing"(Action 1902532604)".


        //Unsupported feature: Property Modification (Level) on ""Adjust Item Cost/Price"(Action 1900805004)".


        //Unsupported feature: Property Modification (Level) on "ApplyTemplate(Action 147)".


        //Unsupported feature: Property Modification (Level) on "ShowLog(Action 148)".


        //Unsupported feature: Property Modification (Level) on ""Co&mments"(Action 15)".

        modify("Sales_Prices")
        {
            Visible = false;
        }
        modify(Resources)
        {

            //Unsupported feature: Property Modification (Level) on "Resources(Action 62)".


            //Unsupported feature: Property Modification (ActionType) on "Resources(Action 62)".


            //Unsupported feature: Property Modification (Name) on "Resources(Action 62)".

            Caption = 'Item Reclass. Journal';

            //Unsupported feature: Property Modification (Image) on "Resources(Action 62)".


            //Unsupported feature: Property Insertion (RunObject) on "Resources(Action 62)".

            Promoted = false;
        }
        modify("Request Approval")
        {
            Visible = false;
        }
        modify(SendApprovalRequest)
        {
            Visible = false;
        }
        moveafter(; Item)
        moveafter("Prices_Prices"; PricesDiscountsOverview)
        moveafter("Revaluation Journal"; Workflow)
        moveafter(ManageApprovalWorkflow; CopyItem)
        moveafter(CopyItem; "Item Reclassification Journal")
        moveafter(ActionContainer1900000004; "F&unctions")
        moveafter("Prices_LineDiscounts"; "Requisition Worksheet")
        moveafter("Item Journal"; Resources)
    }
}

