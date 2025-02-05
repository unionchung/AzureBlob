pageextension 88100 DocumentAttDetailsExt extends "Document Attachment Details"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(processing)
        {
            action(DownloadBlob)
            {
                ApplicationArea = All;
                Caption = 'Download Blob';
                Image = Download;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Download the file to your device. Depending on the file, you will need an app to view or edit the file.';

                trigger OnAction()
                var
                    ABSBlobClient: codeunit "ABS Blob Client";
                    Authorization: Interface "Storage Service Authorization";
                    ABSContainersetup: Record "ABS Container setup";
                    StorageServiceAuthorization: Codeunit "Storage Service Authorization";
                    Filename: Text;
                begin
                    ABSContainersetup.Get;
                    Authorization := StorageServiceAuthorization.CreateSharedKey(ABSContainersetup."Shared Access Key");
                    ABSBlobClient.Initialize(ABSContainersetup."Account Name", ABSContainersetup."Container Name", Authorization);
                    Filename := Rec."File Name" + '.' + Rec."File Extension";
                    ABSBlobClient.GetBlobAsFile(Filename);
                end;
            }
        }
    }

    var
        myInt: Integer;
}