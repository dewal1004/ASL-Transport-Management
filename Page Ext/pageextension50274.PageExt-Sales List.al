pageextension 50274 pageextension50274 extends "Sales List"
{
    actions
    {
        addafter("Sales Reservation Avail.")
        {
            action("Print Delivery Note")
            {
                Image = Delivery;
                RunObject = Report "Sales Delivery Note";
                RunPageOnRec = true;
            }
        }
    }
}

