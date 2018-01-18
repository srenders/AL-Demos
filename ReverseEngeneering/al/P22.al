page 22 "Customer List"
{
    // version NAVW111.00

    CaptionML = ENU='Customers',
                FRB='Clients',
                NLB='Klanten';
    CardPageID = "Customer Card";
    Editable = false;
    PageType = List;
    PromotedActionCategoriesML = ENU='New,Process,Report,Approve,New Document,Request Approval,Customer',
                                 FRB='Nouveau,Traiter,Déclarer,Approuver,Nouveau document,Demander une approbation,Client',
                                 NLB='Nieuw,Verwerken,Rapporteren,Goedkeuren,Nieuw document,Goedkeuring aanvragen,Klant';
    RefreshOnActivate = true;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No.";"No.")
                {
                    ApplicationArea = All;
                    ToolTipML = ENU='Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.',
                                FRB='Spécifie le numéro du client. Le champ est renseigné automatiquement à partir d''une souche de numéros définie, ou vous saisissez manuellement le numéro, car vous avez activé la saisie manuelle de numéro dans le paramétrage de la souche de numéros.',
                                NLB='Hiermee wordt het nummer van de klant opgegeven. Het veld wordt automatisch ingevuld op basis van een gedefinieerde nummerreeks of u voert het nummer handmatig in omdat u handmatig invoeren in de nummerreeksinstellingen hebt ingeschakeld.';
                }
                field(Name;Name)
                {
                    ApplicationArea = All;
                    ToolTipML = ENU='Specifies the customer''s name. This name will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.',
                                FRB='Spécifie le nom du client. Ce nom apparaîtra sur tous les documents vente destinés au client. Vous pouvez entrer au maximum 50 caractères, des chiffres et des lettres.',
                                NLB='Hiermee wordt de naam van de klant opgegeven. Deze naam wordt op alle verkoopdocumenten voor de klant weergegeven. U kunt maximaal 50 tekens (cijfers en letters) invoeren.';
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the code for the responsibility center that will administer this customer by default.',
                                FRB='Spécifie le code du centre de gestion qui gère ce client par défaut.',
                                NLB='Hiermee wordt de code opgegeven voor de divisie die deze klant standaard beheert.';
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies from which location sales to this customer will be processed by default.',
                                FRB='Spécifie à partir de quel magasin les ventes à ce client seront traitées par défaut.',
                                NLB='Hiermee wordt opgegeven vanaf welke locatie verkopen aan deze klant standaard worden verwerkt.';
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the postal code.',
                                FRB='Spécifie le code postal.',
                                NLB='Hiermee wordt de postcode opgegeven.';
                    Visible = false;
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the country/region of the address.',
                                FRB='Spécifie le pays/la région de l''adresse.',
                                NLB='Hiermee wordt het land of de regio van het adres opgegeven.';
                    Visible = false;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer''s telephone number.',
                                FRB='Spécifie le numéro de téléphone du client.',
                                NLB='Hiermee wordt het telefoonnummer van de klant opgegeven.';
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    ApplicationArea = Intercompany;
                    ToolTipML = ENU='Specifies the customer''s intercompany partner code.',
                                FRB='Spécifie le code partenaire intersociété du client.',
                                NLB='Hiermee wordt de IC-partnercode van de klant opgegeven.';
                    Visible = false;
                }
                field(Contact;Contact)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the name of the person you regularly contact when you do business with this customer.',
                                FRB='Spécifie le nom de la personne que vous contactez régulièrement lorsque vous traitez avec ce client.',
                                NLB='Hiermee wordt de naam opgegeven van de persoon met wie u regelmatig contact opneemt wanneer u zaken met deze klant doet.';
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies a code for the salesperson who normally handles this customer''s account.',
                                FRB='Spécifie un code pour le vendeur qui s''occupe habituellement du compte de ce client.',
                                NLB='Hiermee wordt een code opgegeven voor de verkoper die de rekening van deze klant normaal gesproken behandelt.';
                    Visible = false;
                }
                field("Customer Posting Group";"Customer Posting Group")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer''s market type to link business transactions to.',
                                FRB='Spécifie le type de marché du client auquel associer des transactions commerciales.',
                                NLB='Hiermee wordt het marktsoort van de klant opgegeven om bedrijfstransacties aan te koppelen.';
                    Visible = false;
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.',
                                FRB='Spécifie le type commercial du client pour lier les transactions effectuées pour ce client au compte général approprié en fonction des paramètres de validation généraux.',
                                NLB='Hiermee wordt het handelstype van de klant opgegeven om transacties die voor deze klant zijn gemaakt, aan de juiste grootboekrekening te koppelen volgens de algemene boekingsinstelling.';
                    Visible = false;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer''s VAT specification to link transactions made for this customer to.',
                                FRB='Spécifie le détail TVA du client auquel associer des transactions faites pour ce client.',
                                NLB='Hiermee wordt de btw-specificatie van de klant opgegeven om voor deze klant uitgevoerde transacties aan te koppelen.';
                    Visible = false;
                }
                field("Customer Price Group";"Customer Price Group")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer price group code, which you can use to set up special sales prices in the Sales Prices window.',
                                FRB='Spécifie le code groupe prix client que vous pouvez utiliser pour configurer des prix spécifiques dans la fenêtre Prix vente.',
                                NLB='Hiermee wordt de code opgegeven van de klantenprijsgroep die u kunt gebruiken om speciale verkoopprijzen in te stellen in het venster Verkoopprijzen.';
                    Visible = false;
                }
                field("Customer Disc. Group";"Customer Disc. Group")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer discount group code, which you can use as a criterion to set up special discounts in the Sales Line Discounts window.',
                                FRB='Spécifie le code groupe remises client que vous pouvez utiliser comme critère pour configurer des remises spécifiques dans la fenêtre Remises ligne vente.',
                                NLB='Hiermee wordt de code opgegeven van de klantenkortingsgroep die u kunt gebruiken als criterium om speciale kortingen in te stellen in het venster Verkoopregelkortingen.';
                    Visible = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies a code that indicates the payment terms that you require of the customer.',
                                FRB='Spécifie un code qui indique les conditions de paiement que vous exigez du client.',
                                NLB='Hiermee wordt een code opgegeven die aangeeft welke betalingsvoorwaarden u van de klant vereist.';
                    Visible = false;
                }
                field("Reminder Terms Code";"Reminder Terms Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies how reminders about late payments are handled for this customer.',
                                FRB='Spécifie la manière dont les relances concernant les retards de paiement sont traitées pour ce client.',
                                NLB='Hiermee wordt opgegeven hoe aanmaningen voor te late betalingen voor deze klant worden verwerkt.';
                    Visible = false;
                }
                field("Fin. Charge Terms Code";"Fin. Charge Terms Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies finance charges are calculated for the customer.',
                                FRB='Spécifie les intérêts calculés pour le client.',
                                NLB='Hiermee worden rentefacturen opgegeven die voor de klant worden berekend.';
                    Visible = false;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the default currency for the customer.',
                                FRB='Spécifie la devise par défaut pour le client.',
                                NLB='Hiermee wordt de standaardvalutacode voor de klant opgegeven.';
                    Visible = false;
                }
                field("Language Code";"Language Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the language to be used on printouts for this customer.',
                                FRB='Spécifie la langue à utiliser sur des impressions destinées à ce client.',
                                NLB='Hiermee wordt de taal opgegeven die moet worden gebruikt op afdrukken voor deze klant.';
                    Visible = false;
                }
                field("Search Name";"Search Name")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies an alternate name that you can use to search for a customer when you cannot remember the value in the Name field.',
                                FRB='Spécifie un autre nom que vous pouvez utiliser pour rechercher un client lorsque vous ne vous souvenez plus de la valeur dans le champ Nom.',
                                NLB='Hiermee wordt een alternatieve naam opgegeven die u kunt gebruiken om een klant te zoeken wanneer u zich de waarde in het veld Naam niet kunt herinneren.';
                    Visible = false;
                }
                field("Credit Limit (LCY)";"Credit Limit (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.',
                                FRB='Spécifie le montant maximal selon lequel vous autorisez au client à dépasser le solde de paiement avant que des alertes ne soient émises.',
                                NLB='Hiermee wordt het maximale bedrag opgegeven waarmee de klant het betaalsaldo mag overschrijden voordat waarschuwingen worden verzonden.';
                    Visible = false;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies which transactions with the customer that cannot be blocked, for example, because the customer is declared insolvent.',
                                FRB='Spécifie les transactions avec le client qui ne peuvent pas être bloquées, par exemple, parce que le client est déclaré insolvable.',
                                NLB='Hiermee wordt opgegeven welke transacties met de klant niet kunnen worden geblokkeerd, bijvoorbeeld omdat de klant insolvent is verklaard.';
                    Visible = false;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies when the customer card was last modified.',
                                FRB='Indique la date à laquelle la fiche client a été modifiée pour la dernière fois.',
                                NLB='Hiermee wordt opgegeven wanneer de klantenkaart het laatst is gewijzigd.';
                    Visible = false;
                }
                field("Application Method";"Application Method")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies how to apply payments to entries for this customer.',
                                FRB='Spécifie la manière de lettrer des paiements avec des écritures pour ce client.',
                                NLB='Hiermee wordt opgegeven hoe betalingen moeten worden vereffend met posten voor deze klant.';
                    Visible = false;
                }
                field("Combine Shipments";"Combine Shipments")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies if several orders delivered to the customer can appear on the same sales invoice.',
                                FRB='Spécifie si plusieurs commandes livrées au client peuvent se trouver sur la même facture vente.',
                                NLB='Hiermee wordt opgegeven of meerdere orders die aan de klant worden geleverd, in dezelfde verkoopfactuur kunnen worden opgenomen.';
                    Visible = false;
                }
                field(Reserve;Reserve)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies whether items will never, automatically (Always), or optionally be reserved for this customer. Optional means that you must manually reserve items for this customer.',
                                FRB='Spécifie si des articles ne seront jamais, automatiquement (toujours) ou éventuellement réservés pour ce client. En option signifie que vous devez réserver manuellement des articles pour ce client.',
                                NLB='Hiermee wordt opgegeven of artikelen nooit, automatisch (altijd) of optioneel voor deze klant worden gereserveerd. Optioneel betekent dat u handmatig artikelen voor deze klant moet reserveren.';
                    Visible = false;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies if the customer accepts partial shipment of orders.',
                                FRB='Spécifie si le client accepte l''expédition partielle des commandes.',
                                NLB='Hiermee wordt opgegeven of de klant een gedeeltelijke verzending van orders accepteert.';
                    Visible = false;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the code for the shipping agent who is transporting the items.',
                                FRB='Spécifie le code du transporteur des articles.',
                                NLB='Hiermee wordt de code opgegeven van de expediteur die de artikelen transporteert.';
                    Visible = false;
                }
                field("Base Calendar Code";"Base Calendar Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies a customizable calendar for shipment planning that includes the customer''s working days and holidays.',
                                FRB='Spécifie un calendrier personnalisable pour la planification d''expédition qui inclut les vacances et jours ouvrés du client.',
                                NLB='Hiermee wordt een aanpasbare agenda voor planning van verzending opgegeven die de werkdagen en vakantiedagen van de klant bevat.';
                    Visible = false;
                }
                field("Balance (LCY)";"Balance (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.',
                                FRB='Spécifie le montant règlement que le client doit régler pour les ventes réalisées. Cette valeur est également appelée le solde du client.',
                                NLB='Hiermee wordt het betalingsbedrag opgegeven dat de klant voor afgesloten verkoop verschuldigd is. Deze waarde wordt ook het saldo van de klant genoemd.';

                    trigger OnDrillDown();
                    begin
                        OpenCustomerLedgerEntries(false);
                    end;
                }
                field("Balance Due (LCY)";"Balance Due (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies payments from the customer that are overdue per today''s date.',
                                FRB='Spécifie les paiements effectués par le client échus pour la date du jour.',
                                NLB='Hiermee worden betalingen van de klant opgegeven die op de datum van vandaag achterstallig zijn.';

                    trigger OnDrillDown();
                    begin
                        OpenCustomerLedgerEntries(true);
                    end;
                }
                field("Sales (LCY)";"Sales (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the total net amount of sales to the customer in LCY.',
                                FRB='Spécifie le montant net total des ventes à ce client en devise société.',
                                NLB='Hiermee wordt in de lokale valuta het totale nettobedrag opgegeven van verkopen aan de klant.';
                }
            }
        }
        area(factboxes)
        {
            part("Power BI Report FactBox";"Power BI Report FactBox")
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Power BI Reports',
                            FRB='États Power BI',
                            NLB='Power BI-rapporten';
                Visible = PowerBIVisible;
            }
            part(Control99;"CRM Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No."=FIELD("No.");
                Visible = CRMIsCoupledToRecord;
            }
            part(Control35;"Social Listening FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Source Type"=CONST(Customer),
                              "Source No."=FIELD("No.");
                Visible = SocialListeningVisible;
            }
            part(Control33;"Social Listening Setup FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Source Type"=CONST(Customer),
                              "Source No."=FIELD("No.");
                UpdatePropagation = Both;
                Visible = SocialListeningSetupVisible;
            }
            part(SalesHistSelltoFactBox;"Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic,Suite;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
            }
            part(SalesHistBilltoFactBox;"Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(CustomerStatisticsFactBox;"Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
            }
            part(CustomerDetailsFactBox;"Customer Details FactBox")
            {
                ApplicationArea = Basic,Suite;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1907829707;"Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1902613707;"Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            systempart(Control1900383207;Links)
            {
            }
            systempart(Control1905767507;Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Customer")
            {
                CaptionML = ENU='&Customer',
                            FRB='&Client',
                            NLB='&Klant';
                Image = Customer;
                action("Co&mments")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Co&mments',
                                FRB='Commentaire&s',
                                NLB='Op&merkingen';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=CONST(Customer),
                                  "No."=FIELD("No.");
                    ToolTipML = ENU='View or add comments for the record.',
                                FRB='Affichez ou ajoutez des commentaires pour l''enregistrement.',
                                NLB='Opmerkingen weergeven of toevoegen voor de record.';
                }
                group(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRB='Axes analytiques',
                                NLB='Dimensies';
                    Image = Dimensions;
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Dimensions-Single',
                                    FRB='Affectations - Simples',
                                    NLB='Dimensies - Enkel';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID"=CONST(18),
                                      "No."=FIELD("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTipML = ENU='View or edit the single set of dimensions that are set up for the selected record.',
                                    FRB='Affichez ou modifiez l''ensemble unique de dimensions paramétrées pour l''enregistrement sélectionné.',
                                    NLB='De enkele dimensieset weergeven of bewerken die voor de geselecteerde record is ingesteld.';
                    }
                    action(DimensionsMultiple)
                    {
                        AccessByPermission = TableData Dimension=R;
                        ApplicationArea = Suite;
                        CaptionML = ENU='Dimensions-&Multiple',
                                    FRB='Affectations - &Multiples',
                                    NLB='Dimensies - &Multi';
                        Image = DimensionSets;
                        ToolTipML = ENU='View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.',
                                    FRB='Affichez ou modifiez les axes analytiques pour un groupe d''enregistrements. Vous pouvez affecter des codes axe aux transactions dans le but de répartir les coûts et d''analyser les informations d''historique.',
                                    NLB='Dimensies voor een groep records weergeven of bewerken. U kunt dimensiecodes toewijzen aan transacties om kosten te verdelen en historische informatie te analyseren.';

                        trigger OnAction();
                        var
                            Cust : Record Customer;
                            DefaultDimMultiple : Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SETSELECTIONFILTER(Cust);
                            DefaultDimMultiple.SetMultiCust(Cust);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Bank Accounts',
                                FRB='Comptes bancaires',
                                NLB='Bankrekeningen';
                    Image = BankAccount;
                    RunObject = Page "Customer Bank Account List";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='View or set up the customer''s bank accounts. You can set up any number of bank accounts for each customer.',
                                FRB='Affichez ou configurez les comptes bancaires de votre client. Vous pouvez configurer autant de comptes bancaires que vous le souhaitez pour chaque client.',
                                NLB='Bankrekeningen van de klant weergeven of instellen. U kunt een willekeurig aantal bankrekeningen instellen voor elke klant.';
                }
                action("Direct Debit Mandates")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Direct Debit Mandates',
                                FRB='Mandats de domiciliation européenne',
                                NLB='Mandaten voor Europese domiciliëring';
                    Image = MakeAgreement;
                    RunObject = Page "SEPA Direct Debit Mandates";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='View the direct-debit mandates that reflect agreements with customers to collect invoice payments from their bank account.',
                                FRB='Affichez les mandats de prélèvement que vous définissez afin de refléter les accords passés avec les clients pour le recouvrement des paiements des factures sur leur compte bancaire.',
                                NLB='De incassomachtigingen weergeven die overeenkomen met overeenkomsten met klanten om factuurbetalingen te innen van hun bankrekening.';
                }
                action(ShipToAddresses)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Ship-&to Addresses',
                                FRB='&Adresses destinataire',
                                NLB='Ver&zendadressen';
                    Image = ShipAddress;
                    RunObject = Page "Ship-to Address List";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='View or edit alternate shipping addresses where the customer wants items delivered if different from the regular address.',
                                FRB='Affichez ou modifiez les autres adresses de livraison où le client souhaite faire livrer les articles, si elles sont différentes de l''adresse habituelle.',
                                NLB='Alternatieve verzendadressen weergeven of bewerken waar de klant wil dat artikelen wordt geleverd, als de adressen afwijken van het normale adres.';
                }
                action("C&ontact")
                {
                    AccessByPermission = TableData Contact=R;
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='C&ontact',
                                FRB='C&ontact',
                                NLB='&Contact';
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true;
                    ToolTipML = ENU='View or edit detailed information about the contact person at the customer.',
                                FRB='Affichez ou modifiez des informations détaillées concernant la personne à contacter chez le client.',
                                NLB='Gedetailleerde informatie weergeven of bewerken over de contactpersoon bij de klant.';

                    trigger OnAction();
                    begin
                        ShowContact;
                    end;
                }
                action("Cross Re&ferences")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Cross Re&ferences',
                                FRB='&Références externes',
                                NLB='Kruisver&wijzingen';
                    Image = Change;
                    RunObject = Page "Cross References";
                    RunPageLink = "Cross-Reference Type"=CONST(Customer),
                                  "Cross-Reference Type No."=FIELD("No.");
                    RunPageView = SORTING("Cross-Reference Type","Cross-Reference Type No.");
                    ToolTipML = ENU='Set up the customer''s own identification of items that you sell to the customer. Cross-references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.',
                                FRB='Configurez la manière dont le client identifie les articles que vous lui vendez. Les références externes au numéro d''article du client impliquent que le numéro d''article est automatiquement affiché sur les documents vente au lieu du numéro que vous utilisez.',
                                NLB='De eigen identificatie van de klant instellen voor artikelen die u aan de klant verkoopt. Kruisverwijzingen naar het artikelnummer van de klant betekenen dat het artikelnummer automatisch op verkoopdocumenten wordt weergegeven in plaats van het nummer dat u gebruikt.';
                }
                action(OnlineMap)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Online Map',
                                FRB='Online Map',
                                NLB='Online Map';
                    Image = Map;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTipML = ENU='View the address on an online map.',
                                FRB='Affichez l''adresse sur une carte en ligne.',
                                NLB='Het adres weergeven op een onlinekaart.';
                    Visible = false;

                    trigger OnAction();
                    begin
                        DisplayMap;
                    end;
                }
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry"=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Approvals',
                                FRB='Approbations',
                                NLB='Goedkeuringen';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true;
                    ToolTipML = ENU='View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.',
                                FRB='Affichez une liste des enregistrements en attente d''approbation. Par exemple, vous pouvez voir qui a demandé l''approbation de l''enregistrement, quand il a été envoyé et quand son approbation est due.',
                                NLB='Een lijst weergeven met de records die wachten op goedkeuring. U kunt bijvoorbeeld zien wie goedkeuring van de record heeft aangevraagd, wanneer de record is verzonden en wanneer deze moet worden goedgekeurd.';

                    trigger OnAction();
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                    end;
                }
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU='Dynamics 365 for Sales',
                            FRB='Dynamics 365 for Sales',
                            NLB='Dynamics 365 for Sales';
                Visible = CRMIntegrationEnabled;
                action(CRMGotoAccount)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Account',
                                FRB='Compte',
                                NLB='Account';
                    Image = CoupledCustomer;
                    ToolTipML = ENU='Open the coupled Dynamics 365 for Sales account.',
                                FRB='Ouvrez le compte Dynamics 365 for Sales couplé.',
                                NLB='Het gekoppelde Dynamics 365 for Sales-account openen.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RECORDID);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record"=IM;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Synchronize Now',
                                FRB='Synchroniser maintenant',
                                NLB='Nu synchroniseren';
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTipML = ENU='Send or get updated data to or from Dynamics 365 for Sales.',
                                FRB='Envoyez/recevez des données mises à jour à/de Dynamics 365 for Sales.',
                                NLB='Bijgewerkte gegevens verzenden naar of ophalen uit Dynamics 365 for Sales.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        Customer : Record Customer;
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                        CustomerRecordRef : RecordRef;
                    begin
                        CurrPage.SETSELECTIONFILTER(Customer);
                        Customer.NEXT;

                        if Customer.COUNT = 1 then
                          CRMIntegrationManagement.UpdateOneNow(Customer.RECORDID)
                        else begin
                          CustomerRecordRef.GETTABLE(Customer);
                          CRMIntegrationManagement.UpdateMultipleNow(CustomerRecordRef);
                        end
                    end;
                }
                action(UpdateStatisticsInCRM)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Update Account Statistics',
                                FRB='Mettre à jour les statistiques compte',
                                NLB='Rekeningstatistiek bijwerken';
                    Enabled = CRMIsCoupledToRecord;
                    Image = UpdateXML;
                    ToolTipML = ENU='Send customer statistics data to Dynamics 365 for Sales to update the Account Statistics FactBox.',
                                FRB='Envoyer les données statistiques client à Dynamics 365 for Sales pour mettre à jour le récapitulatif Statistiques compte.',
                                NLB='Klantstatistiekgegevens verzenden naar Dynamics 365 for Sales om het infoblok Rekeningstatistiek bij te werken.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.CreateOrUpdateCRMAccountStatistics(Rec);
                    end;
                }
                group(Coupling)
                {
                    CaptionML = Comment='Coupling is a noun',
                                ENU='Coupling',
                                FRB='Couplage',
                                NLB='Koppeling';
                    Image = LinkAccount;
                    ToolTipML = ENU='Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Dynamics 365 for Sales record.',
                                FRB='Créez, modifiez ou supprimez un couplage entre l''enregistrement Microsoft Dynamics NAV et un enregistrement Dynamics 365 for Sales.',
                                NLB='Een koppeling tussen de Microsoft Dynamics NAV-record en een Dynamics 365 for Sales-record maken, wijzigen of verwijderen.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record"=IM;
                        ApplicationArea = Suite;
                        CaptionML = ENU='Set Up Coupling',
                                    FRB='Configurer le couplage',
                                    NLB='Koppeling instellen';
                        Image = LinkAccount;
                        Promoted = true;
                        PromotedCategory = Category7;
                        ToolTipML = ENU='Create or modify the coupling to a Dynamics 365 for Sales account.',
                                    FRB='Créez ou modifiez le couplage avec un compte Dynamics 365 for Sales.',
                                    NLB='De koppeling met een Dynamics 365 for Sales-account maken of wijzigen.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction();
                        var
                            CRMIntegrationManagement : Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(RECORDID);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record"=IM;
                        ApplicationArea = Suite;
                        CaptionML = ENU='Delete Coupling',
                                    FRB='Supprimer le couplage',
                                    NLB='Koppeling verwijderen';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTipML = ENU='Delete the coupling to a Dynamics 365 for Sales account.',
                                    FRB='Supprimez le couplage avec un compte Dynamics 365 for Sales.',
                                    NLB='De koppeling met een Dynamics 365 for Sales-account verwijderen.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction();
                        var
                            CRMCouplingManagement : Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(RECORDID);
                        end;
                    }
                }
                group(Create)
                {
                    CaptionML = ENU='Create',
                                FRB='Créer',
                                NLB='Maken';
                    Image = NewCustomer;
                    action(CreateInCRM)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Create Account in Dynamics 365 for Sales',
                                    FRB='Créez un compte dans Dynamics 365 for Sales',
                                    NLB='Account maken in Dynamics 365 for Sales';
                        Image = NewCustomer;
                        ToolTipML = ENU='Generate the account in the coupled Dynamics 365 for Sales account.',
                                    FRB='Générez le compte dans le compte Dynamics 365 for Sales couplé.',
                                    NLB='Het account genereren in het gekoppelde Dynamics 365 for Sales-account.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction();
                        var
                            Customer : Record Customer;
                            CRMIntegrationManagement : Codeunit "CRM Integration Management";
                        begin
                            CurrPage.SETSELECTIONFILTER(Customer);
                            CRMIntegrationManagement.CreateNewRecordsInCRM(Customer);
                        end;
                    }
                    action(CreateFromCRM)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Create Customer in Dynamics NAV',
                                    FRB='Créer un client dans Dynamics NAV',
                                    NLB='Klant maken in Dynamics NAV';
                        Image = NewCustomer;
                        ToolTipML = ENU='Generate the customer in the coupled Dynamics 365 for Sales account.',
                                    FRB='Générez le client dans le compte Dynamics 365 for Sales couplé.',
                                    NLB='De klant genereren in het gekoppelde Dynamics 365 for Sales-account.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction();
                        var
                            CRMIntegrationManagement : Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.CreateNewCustomerFromCRM;
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Synchronization Log',
                                FRB='Journal de synchronisation',
                                NLB='Synchronisatielogbestand';
                    Image = Log;
                    ToolTipML = ENU='View integration synchronization jobs for the customer table.',
                                FRB='Affichez les projets de synchronisation d''intégration pour la table Client.',
                                NLB='Synchronisatietaken voor integratie voor de klanttabel weergeven.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(RECORDID);
                    end;
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            FRB='Historique',
                            NLB='Geschiedenis';
                Image = History;
                action(CustomerLedgerEntries)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Ledger E&ntries',
                                FRB='É&critures comptables',
                                NLB='Poste&n';
                    Image = CustomerLedger;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Customer No.")
                                  ORDER(Descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTipML = ENU='View the history of transactions that have been posted for the selected record.',
                                FRB='Affichez l''historique des transactions qui ont été validées pour l''enregistrement sélectionné.',
                                NLB='De historiek weergeven van transacties die zijn geboekt voor de geselecteerde record.';
                }
                action(Statistics)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Statistics',
                                FRB='Statistiques',
                                NLB='Statistiek';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Customer Statistics";
                    RunPageLink = "No."=FIELD("No."),
                                  "Date Filter"=FIELD("Date Filter"),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                    ToolTipML = ENU='View statistical information, such as the value of posted entries, for the record.',
                                FRB='Afficher les informations statistiques telles que la valeur des écritures validées pour l''enregistrement.',
                                NLB='Statistische informatie, zoals de waarde van geboekte posten, voor de record weergeven.';
                }
                action("S&ales")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='S&ales',
                                FRB='&Ventes',
                                NLB='V&erkoop';
                    Image = Sales;
                    RunObject = Page "Customer Sales";
                    RunPageLink = "No."=FIELD("No."),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                    ToolTipML = ENU='Shows a summary of customer ledger entries. You select the time interval in the View by field. The Period column on the left contains a series of dates that are determined by the time interval you have selected.',
                                FRB='Affiche un récapitulatif des écritures comptables client. Sélectionnez l''intervalle de temps dans le champ Afficher par. La colonne Début période située à gauche affiche une série de dates qui sont déterminées par l''intervalle de temps que vous avez sélectionné.',
                                NLB='Hiermee wordt een overzicht van klantposten weergegeven. U selecteert het tijdsinterval in het veld Weergeven per. De kolom Periode aan de linkerkant bevat een reeks datums die wordt bepaald door het geselecteerde tijdsinterval.';
                }
                action("Entry Statistics")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Entry Statistics',
                                FRB='Statistiques écritures',
                                NLB='Boekingsstatistiek';
                    Image = EntryStatistics;
                    RunObject = Page "Customer Entry Statistics";
                    RunPageLink = "No."=FIELD("No."),
                                  "Date Filter"=FIELD("Date Filter"),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                    ToolTipML = ENU='View entry statistics for the record.',
                                FRB='Afficher les statistiques écritures de l''enregistrement.',
                                NLB='Postenstatistieken voor de record weergeven.';
                }
                action("Statistics by C&urrencies")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Statistics by C&urrencies',
                                FRB='Statistiques par &devise',
                                NLB='Statistiek per &valuta';
                    Image = Currencies;
                    RunObject = Page "Cust. Stats. by Curr. Lines";
                    RunPageLink = "Customer Filter"=FIELD("No."),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter"),
                                  "Date Filter"=FIELD("Date Filter");
                    ToolTipML = ENU='View statistics for customers that use multiple currencies.',
                                FRB='Afficher les statistiques pour les clients qui utilisent plusieurs devises.',
                                NLB='Statistieken weergeven voor klanten die meerdere valuta''s gebruiken.';
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = ItemTracking;
                    CaptionML = ENU='Item &Tracking Entries',
                                FRB='&Ecritures traçabilité',
                                NLB='Ar&tikeltraceringsposten';
                    Image = ItemTrackingLedger;
                    ToolTipML = ENU='View serial or lot numbers that are assigned to items.',
                                FRB='Afficher les numéros de série et de lot qui sont affectés aux articles.',
                                NLB='Serie- of lotnummers weergeven die zijn toegewezen aan artikelen.';

                    trigger OnAction();
                    var
                        ItemTrackingDocMgt : Codeunit "Item Tracking Doc. Management";
                    begin
                        ItemTrackingDocMgt.ShowItemTrackingForMasterData(1,"No.",'','','','','');
                    end;
                }
            }
            group(ActionGroup24)
            {
                CaptionML = ENU='S&ales',
                            FRB='&Ventes',
                            NLB='V&erkoop';
                Image = Sales;
                action(Sales_InvoiceDiscounts)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Invoice &Discounts',
                                FRB='Remises &facture',
                                NLB='&Factuurkorting';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code=FIELD("Invoice Disc. Code");
                    ToolTipML = ENU='Set up different discounts that are applied to invoices for the customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.',
                                FRB='Configurez des remises différentes qui seront appliquées aux factures client. Une remise facture est automatiquement accordée au client lorsque le total sur la facture vente dépasse un certain montant.',
                                NLB='Verschillende kortingen instellen die worden toegepast op facturen voor de klant. Er wordt automatisch een factuurkorting aan de klant verleend wanneer het totaal van een verkoopfactuur boven een bepaald bedrag komt.';
                }
                action(Sales_Prices)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Prices',
                                FRB='Prix',
                                NLB='Prijzen';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    ToolTipML = ENU='View or set up different prices for items that you sell to the customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.',
                                FRB='Affichez ou paramétrez des prix différents pour les articles que vous vendez au client. Un prix article est automatiquement affecté sur les lignes facture lorsque les critères spécifiés sont satisfaits, par exemple le client, la quantité ou la date de fin.',
                                NLB='Andere prijzen weergeven of instellen voor artikelen die u aan de klant verkoopt. Er wordt automatisch een artikelprijs op factuurregels gehanteerd als aan de opgegeven criteria wordt voldaan, zoals klant, aantal of einddatum.';
                }
                action(Sales_LineDiscounts)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Line Discounts',
                                FRB='Remises ligne',
                                NLB='Regelkortingen';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    ToolTipML = ENU='View or set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.',
                                FRB='Afficher ou définissez des remises différentes pour les articles que vous vendez au client. Une remise article est automatiquement affectée sur les lignes facture lorsque les critères spécifiés sont satisfaits, par exemple le client, la quantité ou la date de fin.',
                                NLB='Andere kortingen instellen of weergeven voor artikelen die u aan de klant verkoopt. Er wordt automatisch een artikelkorting aan factuurregels toegekend als aan de opgegeven criteria wordt voldaan, zoals klant, aantal of einddatum.';
                }
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Prepayments;
                    CaptionML = ENU='Prepa&yment Percentages',
                                FRB='Pourcentages acom&pte',
                                NLB='&Vooruitbetalingspercentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    ToolTipML = ENU='View or edit the percentages of the price that can be paid as a prepayment. ',
                                FRB='Afficher ou modifier les pourcentages du prix pouvant être réglés comme un acompte. ',
                                NLB='De percentages van de prijs weergeven of bewerken die als een vooruitbetaling kunnen worden betaald. ';
                }
                action("S&td. Cust. Sales Codes")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='S&td. Cust. Sales Codes',
                                FRB='Codes &vente std client',
                                NLB='St&d. klantenverkoopcodes';
                    Image = CodesList;
                    RunObject = Page "Standard Customer Sales Codes";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='View or edit recurring sales lines for the customer.',
                                FRB='Afficher ou modifier des lignes vente récurrentes pour le client.',
                                NLB='Periodieke verkoopregels weergeven of bewerken voor de klant.';
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRB='Documents',
                            NLB='Documenten';
                Image = Documents;
                action(Quotes)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Quotes',
                                FRB='Devis',
                                NLB='Offertes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Sell-to Customer No.");
                    ToolTipML = ENU='View a list of ongoing sales quotes.',
                                FRB='Afficher la liste des devis vente en cours.',
                                NLB='Een lijst met lopende verkoopoffertes weergeven.';
                }
                action(Orders)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Orders',
                                FRB='Commandes',
                                NLB='Orders';
                    Image = Document;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Sell-to Customer No.");
                    ToolTipML = ENU='View a list of ongoing sales orders for the customer.',
                                FRB='Afficher la liste des commandes vente en cours pour le client.',
                                NLB='Een lijst met lopende verkooporders voor de klant weergeven.';
                }
                action("Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    CaptionML = ENU='Return Orders',
                                FRB='Retours',
                                NLB='Retourorders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Order List";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Sell-to Customer No.");
                    ToolTipML = ENU='Open the list of ongoing return orders.',
                                FRB='Ouvrir la liste des retours en cours.',
                                NLB='De lijst met lopende retourorders openen.';
                }
                group("Issued Documents")
                {
                    CaptionML = ENU='Issued Documents',
                                FRB='Documents émis',
                                NLB='Verzonden documenten';
                    Image = Documents;
                    action("Issued &Reminders")
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Issued &Reminders',
                                    FRB='&Relances émises',
                                    NLB='Verzonden &aanmaningen';
                        Image = OrderReminder;
                        RunObject = Page "Issued Reminder List";
                        RunPageLink = "Customer No."=FIELD("No.");
                        RunPageView = SORTING("Customer No.","Posting Date");
                        ToolTipML = ENU='View the reminders that you have sent to the customer.',
                                    FRB='Afficher les rappels que vous avez envoyés au client.',
                                    NLB='De aanmaningen weergeven die u naar de klant hebt verzonden.';
                    }
                    action("Issued &Finance Charge Memos")
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Issued &Finance Charge Memos',
                                    FRB='Fact&ures d''intérêts émises',
                                    NLB='Verzonden &rentefacturen';
                        Image = FinChargeMemo;
                        RunObject = Page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No."=FIELD("No.");
                        RunPageView = SORTING("Customer No.","Posting Date");
                        ToolTipML = ENU='View the finance charge memos that you have sent to the customer.',
                                    FRB='Afficher les factures d''intérêts que vous avez envoyées au client.',
                                    NLB='De rentefacturen weergeven die u naar de klant hebt verzonden.';
                    }
                }
                action("Blanket Orders")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Blanket Orders',
                                FRB='Commandes ouvertes',
                                NLB='Raamcontracten';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Sales Orders";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Sell-to Customer No.");
                    ToolTipML = ENU='Open the list of ongoing blanket orders.',
                                FRB='Ouvrir la liste des commandes ouvertes en cours.',
                                NLB='De lijst met lopende raamcontracten openen.';
                }
            }
            group(Service)
            {
                CaptionML = ENU='Service',
                            FRB='Service',
                            NLB='Service';
                Image = ServiceItem;
                action("Service Orders")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Service Orders',
                                FRB='Commandes service',
                                NLB='Serviceorders';
                    Image = Document;
                    RunObject = Page "Service Orders";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Customer No.");
                    ToolTipML = ENU='Open the list of ongoing service orders.',
                                FRB='Ouvrir la liste des commandes service en cours.',
                                NLB='De lijst met lopende serviceorders openen.';
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Ser&vice Contracts',
                                FRB='&Contrats de service',
                                NLB='Servicec&ontracten';
                    Image = ServiceAgreement;
                    RunObject = Page "Customer Service Contracts";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Customer No.","Ship-to Code");
                    ToolTipML = ENU='Open the list of ongoing service contracts.',
                                FRB='Ouvrir la liste des contrats de service en cours.',
                                NLB='De lijst met lopende servicecontracten openen.';
                }
                action("Service &Items")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Service &Items',
                                FRB='Ar&ticles de service',
                                NLB='Serviceart&ikelen';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Customer No.","Ship-to Code","Item No.","Serial No.");
                    ToolTipML = ENU='View or edit the service items that are registered for the customer.',
                                FRB='Afficher ou modifier les articles de service qui sont enregistrés pour le client.',
                                NLB='De serviceartikelen weergeven of bewerken die voor de klant zijn geregistreerd.';
                }
            }
        }
        area(creation)
        {
            action(NewSalesBlanketOrder)
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Blanket Sales Order',
                            FRB='Commande ouverte vente',
                            NLB='Verkoopraamcontract';
                Image = BlanketOrder;
                RunObject = Page "Blanket Sales Order";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a blanket sales order for the customer.',
                            FRB='Créer une commande ouverte vente pour le client.',
                            NLB='Een verkoopraamcontract voor de klant maken.';
            }
            action(NewSalesQuote)
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Quote',
                            FRB='Devis',
                            NLB='Verk.-offerte';
                Image = NewSalesQuote;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Sales Quote";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Offer items or services to a customer.',
                            FRB='Proposer des articles ou des services à un client.',
                            NLB='Artikelen of services aanbieden aan een klant.';
            }
            action(NewSalesInvoice)
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Invoice',
                            FRB='Facture vente',
                            NLB='Verk.-factuur';
                Image = NewSalesInvoice;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Sales Invoice";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a sales invoice for the customer.',
                            FRB='Créez une facture vente pour le client.',
                            NLB='Een verkoopfactuur voor de klant maken.';
            }
            action(NewSalesOrder)
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Order',
                            FRB='Commande vente',
                            NLB='Verkooporder';
                Image = Document;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Sales Order";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a sales order for the customer.',
                            FRB='Créez une commande vente pour le client.',
                            NLB='Een verkooporder voor de klant maken.';
            }
            action(NewSalesCrMemo)
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Credit Memo',
                            FRB='Avoir vente',
                            NLB='Verk.-creditnota';
                Image = CreditMemo;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Sales Credit Memo";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new sales credit memo to revert a posted sales invoice.',
                            FRB='Créez un avoir vente pour annuler une facture vente validée.',
                            NLB='Een nieuwe verkoopcreditnota maken om een geboekte verkoopfactuur terug te draaien.';
            }
            action(NewSalesReturnOrder)
            {
                ApplicationArea = SalesReturnOrder;
                CaptionML = ENU='Sales Return Order',
                            FRB='Retour vente',
                            NLB='Verkoopretourorder';
                Image = ReturnOrder;
                RunObject = Page "Sales Return Order";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new sales return order for items or services.',
                            FRB='Créer un retour vente pour les articles ou les services.',
                            NLB='Een nieuwe verkoopretourorder maken voor artikelen of services.';
            }
            action(NewServiceQuote)
            {
                ApplicationArea = Service;
                CaptionML = ENU='Service Quote',
                            FRB='Devis service',
                            NLB='Serviceofferte';
                Image = Quote;
                RunObject = Page "Service Quote";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service quote for the customer.',
                            FRB='Créer un devis service pour le client.',
                            NLB='Een nieuwe serviceofferte voor de klant maken.';
            }
            action(NewServiceInvoice)
            {
                ApplicationArea = Service;
                CaptionML = ENU='Service Invoice',
                            FRB='Facture service',
                            NLB='Servicefactuur';
                Image = Invoice;
                RunObject = Page "Service Invoice";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service invoice for the customer.',
                            FRB='Créer une facture service pour le client.',
                            NLB='Een nieuwe servicefactuur voor de klant maken.';
            }
            action(NewServiceOrder)
            {
                ApplicationArea = Service;
                CaptionML = ENU='Service Order',
                            FRB='Commande service',
                            NLB='Serviceorder';
                Image = Document;
                RunObject = Page "Service Order";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service order for the customer.',
                            FRB='Créer une commande service pour le client.',
                            NLB='Een nieuwe serviceorder voor de klant maken.';
            }
            action(NewServiceCrMemo)
            {
                ApplicationArea = Service;
                CaptionML = ENU='Service Credit Memo',
                            FRB='Avoir service',
                            NLB='Servicecreditnota';
                Image = CreditMemo;
                RunObject = Page "Service Credit Memo";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service credit memo for the customer.',
                            FRB='Créer un avoir service pour le client.',
                            NLB='Een nieuwe servicecreditnota voor de klant maken.';
            }
            action(NewReminder)
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Reminder',
                            FRB='Relance',
                            NLB='Aanmaning';
                Image = Reminder;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page Reminder;
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new reminder for the customer.',
                            FRB='Créer une relance pour le client.',
                            NLB='Een nieuwe aanmaning voor de klant maken.';
            }
            action(NewFinChargeMemo)
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Finance Charge Memo',
                            FRB='Facture d''intérêts',
                            NLB='Rentefactuur';
                Image = FinChargeMemo;
                RunObject = Page "Finance Charge Memo";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new finance charge memo.',
                            FRB='Créer une facture d''intérêts.',
                            NLB='Een nieuwe rentefactuur maken.';
            }
        }
        area(processing)
        {
            group(ActionGroup104)
            {
                CaptionML = ENU='History',
                            FRB='Historique',
                            NLB='Historiek';
                Image = History;
                action(CustomerLedgerEntriesHistory)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Ledger E&ntries',
                                FRB='É&critures comptables',
                                NLB='Poste&n';
                    Image = CustomerLedger;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Customer No.");
                    Scope = Repeater;
                    ShortCutKey = 'Ctrl+F7';
                    ToolTipML = ENU='View the history of transactions that have been posted for the selected record.',
                                FRB='Affichez l''historique des transactions qui ont été validées pour l''enregistrement sélectionné.',
                                NLB='De historiek weergeven van transacties die zijn geboekt voor de geselecteerde record.';
                }
            }
            group(PricesAndDiscounts)
            {
                CaptionML = ENU='Prices and Discounts',
                            FRB='Prix et remises',
                            NLB='Prijzen en kortingen';
                action(Prices_InvoiceDiscounts)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Invoice &Discounts',
                                FRB='Remises &facture',
                                NLB='&Factuurkortingen';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code=FIELD("Invoice Disc. Code");
                    Scope = Repeater;
                    ToolTipML = ENU='Set up different discounts applied to invoices for the selected customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.',
                                FRB='Configurez des remises différentes qui seront lettrées aux factures pour le client sélectionné. Une remise facture est automatiquement accordée au client lorsque le total sur la facture vente dépasse un certain montant.',
                                NLB='Andere kortingen instellen die worden gebruikt voor facturen voor de geselecteerde klant. Er wordt automatisch een factuurkorting aan de klant verleend wanneer het totaal van een verkoopfactuur een bepaald bedrag overschrijdt.';
                }
                action(Prices_Prices)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Prices',
                                FRB='Prix',
                                NLB='Prijzen';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    Scope = Repeater;
                    ToolTipML = ENU='View or set up different prices for items that you sell to the selected customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.',
                                FRB='Affichez ou paramétrez des prix différents pour les articles que vous vendez au client sélectionné. Un prix article est automatiquement affecté sur les lignes facture lorsque les critères spécifiés sont satisfaits, par exemple le client, la quantité ou la date de fin.',
                                NLB='Andere prijzen weergeven of instellen voor artikelen die u aan de geselecteerde klant verkoopt. Er wordt automatisch een artikelprijs op factuurregels gehanteerd als aan de opgegeven criteria wordt voldaan, zoals klant, aantal of einddatum.';
                }
                action(Prices_LineDiscounts)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Line Discounts',
                                FRB='Remises ligne',
                                NLB='Regelkortingen';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    Scope = Repeater;
                    ToolTipML = ENU='View or set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.',
                                FRB='Afficher ou définissez des remises différentes pour les articles que vous vendez au client. Une remise article est automatiquement affectée sur les lignes facture lorsque les critères spécifiés sont satisfaits, par exemple le client, la quantité ou la date de fin.',
                                NLB='Andere kortingen instellen of weergeven voor artikelen die u aan de klant verkoopt. Er wordt automatisch een artikelkorting aan factuurregels toegekend als aan de opgegeven criteria wordt voldaan, zoals klant, aantal of einddatum.';
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRB='Approbation demande achat',
                            NLB='Goedkeuring aanvragen';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Send A&pproval Request',
                                FRB='Envoyer demande d''a&pprobation',
                                NLB='G&oedkeuringsaanvraag verzenden';
                    Enabled = (NOT OpenApprovalEntriesExist) AND EnabledApprovalWorkflowsExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTipML = ENU='Request approval to change the record.',
                                FRB='Demander l''approbation pour modifier l''enregistrement.',
                                NLB='Goedkeuring aanvragen om de record te wijzigen.';

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec) then
                          ApprovalsMgmt.OnSendCustomerForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Cancel Approval Re&quest',
                                FRB='Annuler demande d''appro&bation',
                                NLB='&Goedkeuringsaanvraag annuleren';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTipML = ENU='Cancel the approval request.',
                                FRB='Annulez la demande d''approbation.',
                                NLB='De goedkeuringsaanvraag annuleren.';

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                        WorkflowWebhookManagement : Codeunit "Workflow Webhook Management";
                    begin
                        ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
                        WorkflowWebhookManagement.FindAndCancel(RECORDID);
                    end;
                }
            }
            group(Workflow)
            {
                CaptionML = ENU='Workflow',
                            FRB='Flux de travail',
                            NLB='Werkstroom';
                action(CreateApprovalWorkflow)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Create Approval Workflow',
                                FRB='Créer flux de travail approbation',
                                NLB='Goedkeuringswerkstroom maken';
                    Enabled = NOT EnabledApprovalWorkflowsExist;
                    Image = CreateWorkflow;
                    ToolTipML = ENU='Set up an approval workflow for creating or changing customers, by going through a few pages that will guide you.',
                                FRB='Configurez un flux de travail approbation pour créer ou modifier des clients, en consultant quelques pages qui vous guideront.',
                                NLB='Een goedkeuringswerkstroom voor het maken of wijzigen van klanten instellen door enkele pagina''s te doorlopen die u begeleiden.';

                    trigger OnAction();
                    begin
                        PAGE.RUNMODAL(PAGE::"Cust. Approval WF Setup Wizard");
                        SetWorkflowManagementEnabledState;
                    end;
                }
                action(ManageApprovalWorkflows)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Manage Approval Workflows',
                                FRB='Gérer les flux de travail approbation',
                                NLB='Goedkeuringswerkstromen beheren';
                    Enabled = EnabledApprovalWorkflowsExist;
                    Image = WorkflowSetup;
                    ToolTipML = ENU='View or edit existing approval workflows for creating or changing customers.',
                                FRB='Affichez ou modifiez des flux de travail approbation existants pour créer ou modifier des clients.',
                                NLB='Bestaande goedkeuringswerkstromen voor het maken of wijzigen van klanten weergeven of bewerken.';

                    trigger OnAction();
                    var
                        WorkflowManagement : Codeunit "Workflow Management";
                    begin
                        WorkflowManagement.NavigateToWorkflows(DATABASE::Customer,EventFilter);
                        SetWorkflowManagementEnabledState;
                    end;
                }
            }
            action("Cash Receipt Journal")
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Cash Receipt Journal',
                            FRB='Feuille règlement',
                            NLB='Ontvangstendagboek';
                Image = CashReceiptJournal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Cash Receipt Journal";
                ToolTipML = ENU='Open the cash receipt journal to post incoming payments.',
                            FRB='Ouvrir la feuille règlement pour valider les paiements entrants.',
                            NLB='Het ontvangstendagboek openen om inkomende betalingen te boeken.';
            }
            action("Sales Journal")
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Sales Journal',
                            FRB='Feuille vente',
                            NLB='Verkoopdagboek';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Sales Journal";
                ToolTipML = ENU='Post any sales transaction for the customer.',
                            FRB='Valider les transactions de vente pour le client.',
                            NLB='Verkooptransacties boeken voor de klant.';
            }
            action(ApplyTemplate)
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Apply Template',
                            FRB='Appliquer modèle',
                            NLB='Sjabloon toepassen';
                Ellipsis = true;
                Image = ApplyTemplate;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                ToolTipML = ENU='Apply a template to update one or more entities with your standard settings for a certain type of entity.',
                            FRB='Appliquez un modèle pour mettre à jour une ou plusieurs entités avec vos paramètres standard pour un certain type d''entité.',
                            NLB='Een sjabloon toepassen om een of meer entiteiten bij te werken met uw standaardinstellingen voor een bepaald type entiteit.';

                trigger OnAction();
                var
                    Customer : Record Customer;
                    MiniCustomerTemplate : Record "Mini Customer Template";
                begin
                    CurrPage.SETSELECTIONFILTER(Customer);
                    MiniCustomerTemplate.UpdateCustomersFromTemplate(Customer);
                end;
            }
            group(Display)
            {
                CaptionML = ENU='Display',
                            FRB='Afficher',
                            NLB='Weergeven';
                action(ReportFactBoxVisibility)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Show/Hide Power BI Reports',
                                FRB='Afficher/masquer les états Power BI',
                                NLB='Power BI-rapporten weergeven/verbergen';
                    Image = "Report";
                    ToolTipML = ENU='Select if the Power BI FactBox is visible or not.',
                                FRB='Choisir si le récapitulatif État Power BI est visible ou non.',
                                NLB='Selecteren of het Power BI-infoblok moet worden weergegeven of niet.';

                    trigger OnAction();
                    begin
                        if PowerBIVisible then
                          PowerBIVisible := false
                        else
                          PowerBIVisible := true;
                        // save visibility value into the table
                        CurrPage."Power BI Report FactBox".PAGE.SetFactBoxVisibility(PowerBIVisible);
                    end;
                }
            }
        }
        area(reporting)
        {
            group(Reports)
            {
                CaptionML = ENU='Reports',
                            FRB='États',
                            NLB='Rapporten';
                group(SalesReports)
                {
                    CaptionML = ENU='Sales Reports',
                                FRB='États vente',
                                NLB='Verkooprapporten';
                    Image = "Report";
                    action(ReportCustomerTop10List)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Customer - Top 10 List',
                                    FRB='Clients : Palmarès',
                                    NLB='Klant - Top 10';
                        Image = "Report";
                        RunObject = Report "Customer - Top 10 List";
                        ToolTipML = ENU='View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.',
                                    FRB='Affichez les clients qui achètent le plus ou qui doivent le plus d''argent au cours d''une période sélectionnée. Seuls les clients qui ont des achats pour cette période ou un solde à la fin de la période seront inclus.',
                                    NLB='Een overzicht weergeven van klanten die in een geselecteerde periode het meest kopen of het meest verschuldigd zijn. Alleen klanten die tijdens de periode inkopen hebben gedaan of aan het einde van de periode een saldo hebben, worden opgenomen.';
                    }
                    action(ReportCustomerSalesList)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Customer - Sales List',
                                    FRB='Clients : Liste des ventes',
                                    NLB='Klant - Verkoopoverzicht';
                        Image = "Report";
                        RunObject = Report "Customer - Sales List";
                        ToolTipML = ENU='View customer sales for a period, for example, to report sales activity to customs and tax authorities. You can choose to include only customers with total sales that exceed a minimum amount. You can also specify whether you want the report to show address details for each customer.',
                                    FRB='Afficher les ventes client pour une période. Par exemple, pour signaler une activité vente aux autorités douanières et fiscales. Vous pouvez choisir de n''inclure que les clients dont le total des ventes excède un montant minimum. Vous pouvez également spécifier si vous souhaitez que l''état reprenne les informations adresse de chaque client.',
                                    NLB='Een klantverkoopoverzicht voor een bepaalde periode weergeven om bijvoorbeeld verkoopactiviteiten te rapporteren aan de belastingdienst en de douane. U kunt desgewenst alleen klanten opnemen voor wie de totale verkoopcijfers een minimumbedrag overschrijden. U kunt ook aangeven of u de adresgegevens van de klanten in het rapport wilt weergeven.';
                    }
                    action(ReportSalesStatistics)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Sales Statistics',
                                    FRB='Statistiques vente',
                                    NLB='Verkoopstatistiek';
                        Image = "Report";
                        RunObject = Report "Sales Statistics";
                        ToolTipML = ENU='View customers'' total costs, sales, and profits over time, for example, to analyze earnings trends. The report shows amounts for original and adjusted costs, sales, profits, invoice discounts, payment discounts, and profit percentage in three adjustable periods.',
                                    FRB='Affichez les coûts totaux, les ventes et la marge à long terme des clients, par exemple, pour analyser les tendances bénéficiaires. L''état affiche les montants des coûts originaux et ajustés, des ventes, de la marge, de la remise facture et de l''escompte, ainsi que le pourcentage marge sur vente au cours de trois périodes sélectionnables.',
                                    NLB='Totale kosten, verkoop en winst van klanten over een periode weergeven, bijvoorbeeld om trends in resultaten te analyseren. Het rapport bevat bedragen voor oorspronkelijke en aangepaste kosten, verkoop, winst, factuurkortingen, contantkortingen en winstpercentages in drie aanpasbare perioden.';
                    }
                }
                group(FinanceReports)
                {
                    CaptionML = ENU='Finance Reports',
                                FRB='États financiers',
                                NLB='Financiële rapporten';
                    Image = "Report";
                    action(Action90)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Statement',
                                    FRB='Relevé',
                                    NLB='Rekeningoverzicht';
                        Image = "Report";
                        RunObject = Codeunit "Customer Layout - Statement";
                        ToolTipML = ENU='View a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.',
                                    FRB='Affichez une liste des transactions d''un client pour une période sélectionnée, par exemple, à envoyer au client à la clôture d''une période comptable. Vous pouvez choisir d''afficher tous les soldes échus, sans tenir compte de la période spécifiée, ou d''inclure un cumul date.',
                                    NLB='Een lijst met transacties van een klant in een bepaalde periode weergeven. Deze lijst kan dan bijvoorbeeld aan het eind van een boekingsperiode naar de klant worden verzonden. U kunt alle openstaande saldi weergeven, ongeacht de opgegeven periode, of u kunt ervoor kiezen een vervaldatuminterval op te nemen.';
                    }
                    action(ReportCustomerBalanceToDate)
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Customer - Balance to Date',
                                    FRB='Clients : Écritures ouvertes',
                                    NLB='Klant - Saldo t/m datum';
                        Image = "Report";
                        RunObject = Report "Customer - Balance to Date";
                        ToolTipML = ENU='View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.',
                                    FRB='Afficher une liste reprenant l''historique des paiements des clients jusqu''à une certaine date. Vous pouvez utiliser l''état pour extraire vos revenus de vente totaux à la clôture d''une période comptable ou d''un exercice.',
                                    NLB='Een lijst met de betalingshistoriek van klanten tot een bepaalde datum weergeven. U kunt het rapport gebruiken om er bij de afsluiting van een boekingsperiode of boekjaar uw totale omzet uit te extraheren.';
                    }
                    action(ReportCustomerTrialBalance)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Customer - Trial Balance',
                                    FRB='Clients : Balance',
                                    NLB='Klant - Proefbalans';
                        Image = "Report";
                        RunObject = Report "Customer - Trial Balance";
                        ToolTipML = ENU='View the beginning and ending balance for customers with entries within a specified period. The report can be used to verify that the balance for a customer posting group is equal to the balance on the corresponding general ledger account on a certain date.',
                                    FRB='Affichez le solde d''ouverture et final pour les clients présentant des écritures au cours d''une période spécifiée. L''état peut être utilisé pour vérifier que le solde pour un groupe comptabilisation client est égal à celui du compte général correspondant à une certaine date.',
                                    NLB='Het begin- en eindsaldo voor klanten met posten binnen een opgegeven periode weergeven. Met dit rapport kunt u controleren of het saldo van een klantboekingsgroep op een bepaalde datum gelijk is aan het saldo van de bijbehorende grootboekrekening.';
                    }
                    action(ReportCustomerDetailTrial)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Customer - Detail Trial Bal.',
                                    FRB='Clients : Grand livre client',
                                    NLB='Klant - Historie';
                        Image = "Report";
                        RunObject = Report "Customer - Detail Trial Bal.";
                        ToolTipML = ENU='View the balance for customers with balances on a specified date. The report can be used at the close of an accounting period, for example, or for an audit.',
                                    FRB='Affichez le solde des clients présentant des soldes à une date donnée. L''état peut être utilisé à la clôture d''une période comptable, par exemple, ou pour un audit.',
                                    NLB='Het saldo van klanten met saldi op een bepaalde datum weergeven. Het rapport kan bijvoorbeeld worden gebruikt bij het afsluiten van een boekingsperiode of voor een controle.';
                    }
                    action(ReportCustomerSummaryAging)
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Customer - Summary Aging',
                                    FRB='Clients : Échéancier',
                                    NLB='Klant - Open posten';
                        Image = "Report";
                        RunObject = Report "Customer - Summary Aging";
                        ToolTipML = ENU='View, print, or save a summary of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.',
                                    FRB='Affichez, imprimez ou enregistrez un résumé des totaux dus de chaque client, divisé en trois périodes. Cet état sert à décider quand émettre des relances, à évaluer la solvabilité d''un client ou à préparer des analyses de liquidités.',
                                    NLB='Een in drie perioden onderverdeeld overzicht weergeven, afdrukken of opslaan van het totaal aan openstaande betalingen van elke klant. Dit rapport kan worden gebruikt om te besluiten wanneer aanmaningen moeten worden verzonden, om de kredietwaardigheid van een klant te evalueren of om liquiditeitsanalyses voor te bereiden.';
                    }
                    action(ReportCustomerDetailedAging)
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Customer - Detailed Aging',
                                    FRB='Client - Écritures échues',
                                    NLB='Klant - Vervallen posten';
                        Image = "Report";
                        RunObject = Report "Customer Detailed Aging";
                        ToolTipML = ENU='View, print, or save a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.',
                                    FRB='Affichez, imprimez ou enregistrez une liste détaillée des totaux dus de chaque client, divisée en trois périodes. Cet état sert à décider quand émettre des relances, à évaluer la solvabilité d''un client ou à préparer des analyses de liquidités.',
                                    NLB='Een gedetailleerde, in drie perioden verdeelde lijst met het totaal aan openstaande betalingen van elke klant weergeven, afdrukken of opslaan. Het rapport kan worden gebruikt om te besluiten wanneer er aanmaningen moeten worden verzonden, om de kredietwaardigheid van een klant te evalueren of om liquiditeitsanalyses voor te bereiden.';
                    }
                    action(ReportAgedAccountsReceivable)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Aged Accounts Receivable',
                                    FRB='Comptabilité client âgée',
                                    NLB='Vervallen vorderingen';
                        Image = "Report";
                        RunObject = Report "Aged Accounts Receivable";
                        ToolTipML = ENU='View an overview of when customer payments are due or overdue, divided into four periods. You must specify the date you want aging calculated from and the length of the period that each column will contain data for.',
                                    FRB='Affichez un aperçu des dates d''échéance des paiements dus au client, divisé en quatre périodes. Vous devez spécifier la date à partir de laquelle vous souhaitez que le cumul soit calculé et la durée de la période pour laquelle chaque colonne contiendra des données.',
                                    NLB='Een in vier perioden onderverdeeld overzicht weergeven van wanneer klantbetalingen vervallen of achterstallig zijn. U moet de datum opgeven vanaf wanneer u het verval wilt berekenen, en de lengte van de periode waarvoor gegevens worden opgenomen in elke kolom.';
                    }
                    action(ReportCustomerPaymentReceipt)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Customer - Payment Receipt',
                                    FRB='Reçu paiement client',
                                    NLB='Klant - Betalingsontvangst';
                        Image = "Report";
                        RunObject = Report "Customer - Payment Receipt";
                        ToolTipML = ENU='View a document showing which customer ledger entries that a payment has been applied to. This report can be used as a payment receipt that you send to the customer.',
                                    FRB='Affichez un document présentant les écritures comptables client avec lesquelles un paiement a été lettré. Cet état peut être utilisé comme reçu de paiement à envoyer au client.',
                                    NLB='Een document weergeven dat aangeeft met welke klantenposten een betaling is vereffend. Dit rapport kan worden gebruikt als betalingsontvangst die u naar de klant stuurt.';
                    }
                }
            }
            group(General)
            {
                CaptionML = ENU='General',
                            FRB='Général',
                            NLB='Algemeen';
                action("Customer List")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer List',
                                FRB='Liste des clients',
                                NLB='Klantenoverzicht';
                    Image = "Report";
                    RunObject = Report "Customer - List";
                    ToolTipML = ENU='View various kinds of basic information for customers, such as customer posting group, discount group, finance charge and payment information, salesperson, the customer''s default currency and credit limit (in LCY), and the customer''s current balance (in LCY).',
                                FRB='Afficher diverses informations de base sur les clients, par exemple le groupe comptabilisation, le groupe remise, les informations sur les intérêts de retard et le paiement, le vendeur, la devise par défaut du client et le crédit autorisé (en devise société), ainsi que le solde actuel du client (en devise société).',
                                NLB='Verschillende soorten basisgegevens over klanten weergeven, zoals de klantboekingsgroepen, kortingsgroepen, toeslag- en betalingsgegevens, verkopers, standaardvaluta''s en kredietlimieten van de klanten (in de lokale valuta) en het huidige saldo van elke klant (in de lokale valuta).';
                }
                action("Customer Register")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer Register',
                                FRB='Historique des transactions client',
                                NLB='Klant - Journaal';
                    Image = "Report";
                    RunObject = Report "Customer Register";
                    ToolTipML = ENU='View posted customer ledger entries divided into, and sorted according to, registers. By using a filter, you can select exactly the entries in the registers that you need to see. If you have created many entries and you do not set a filter, the report will print a large amount of information.',
                                FRB='Afficher les écritures comptables client validées en les classant par historique. À l''aide d''un filtre, vous pouvez sélectionner exactement les écritures des historiques que vous souhaitez visualiser. L''état affiche un grand nombre d''informations si de nombreuses écritures ont été générées et que vous ne positionnez pas de filtre.',
                                NLB='Geboekte klantenposten weergeven die zijn verdeeld in en gesorteerd op basis van journalen. Met behulp van filters kunt u precies aangeven welke journaalposten u wilt bekijken. Wanneer er veel posten zijn en u geen filter instelt, zal het rapport een grote hoeveelheid gegevens bevatten.';
                }
                action("Customer - Top 10 List")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Top 10 List',
                                FRB='Clients : Palmarès',
                                NLB='Klant - Top 10';
                    Image = "Report";
                    RunObject = Report "Customer - Top 10 List";
                    ToolTipML = ENU='View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.',
                                FRB='Afficher les clients qui achètent le plus ou qui doivent le plus d''argent au cours d''une période sélectionnée. Seuls les clients qui ont des achats pour cette période ou un solde à la fin de la période seront inclus.',
                                NLB='Een overzicht weergeven van klanten die in een geselecteerde periode het meest kopen of het hoogste saldo hebben openstaan. Alleen klanten die tijdens de periode inkopen hebben gedaan of aan het einde van de periode een saldo hebben, worden opgenomen.';
                }
            }
            group(Sales)
            {
                CaptionML = ENU='Sales',
                            FRB='Ventes',
                            NLB='Verkoop';
                Image = Sales;
                action("Customer - Order Summary")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Order Summary',
                                FRB='Clients : Liste des commandes',
                                NLB='Klant - Samenvatting orders';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Customer - Order Summary";
                    ToolTipML = ENU='View the order detail (the quantity not yet shipped) for each customer in three periods of 30 days each, starting from a selected date. There are also columns with orders to be shipped before and after the three periods and a column with the total order detail for each customer. The report can be used to analyze a company''s expected sales volume.',
                                FRB='Afficher les détails de commande (la quantité pas encore expédiée) pour chaque client sur 3 périodes de 30 jours, chacune commençant à une date sélectionnée. Il contient également des colonnes avec les commandes à livrer avant et après les 3 périodes et une colonne avec le détail de la commande totale de chaque client. Cet état sert à analyser le volume de vente attendu d''une société.',
                                NLB='De ordergegevens (het aantal dat nog niet is verzonden) voor elke klant in drie perioden van dertig dagen weergeven vanaf een geselecteerde datum. Het rapport bevat ook kolommen met orders die voor en na deze drie perioden moeten worden verzonden en een kolom met alle ordergegevens voor elke klant. Met het rapport kunt u het verwachte verkoopvolume van een bedrijf analyseren.';
                }
                action("Customer - Order Detail")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Order Detail',
                                FRB='Clients : Détail des commandes',
                                NLB='Klant - Details orders';
                    Image = "Report";
                    RunObject = Report "Customer - Order Detail";
                    ToolTipML = ENU='View a list of orders divided by customer. The order amounts are totaled for each customer and for the entire list. The report can be used, for example, to obtain an overview of sales over the short term or to analyze possible shipment problems.',
                                FRB='Afficher la liste des commandes réparties par client. Les montants des commandes sont totalisés pour chaque client et pour la liste entière. L''état sert, par exemple, à obtenir un aperçu des ventes à court terme ou à analyser les problèmes de livraison possibles.',
                                NLB='Een lijst weergeven van orders die per klant zijn verdeeld. De totale orderbedragen worden voor elke klant en voor het volledige overzicht weergegeven. Met het rapport kunt u bijvoorbeeld een overzicht van verkopen op de korte termijn bekijken of mogelijke verzendproblemen analyseren.';
                }
                action("Customer - Sales List")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Sales List',
                                FRB='Clients : Liste des ventes',
                                NLB='Klant - Verkoopoverzicht';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Customer - Sales List";
                    ToolTipML = ENU='View customer sales for a period, for example, to report sales activity to customs and tax authorities. You can choose to include only customers with total sales that exceed a minimum amount. You can also specify whether you want the report to show address details for each customer.',
                                FRB='Afficher les ventes client pour une période. Par exemple, pour signaler une activité vente aux autorités douanières et fiscales. Vous pouvez choisir de n''inclure que les clients dont le total des ventes excède un montant minimum. Vous pouvez également spécifier si vous souhaitez que l''état reprenne les informations adresse de chaque client.',
                                NLB='Een klantverkoopoverzicht voor een bepaalde periode weergeven om bijvoorbeeld verkoopactiviteiten te rapporteren aan de belastingdienst en de douane. U kunt desgewenst alleen klanten opnemen voor wie de totale verkoopcijfers een minimumbedrag overschrijden. U kunt ook aangeven of u de adresgegevens van de klanten in het rapport wilt weergeven.';
                }
                action("Sales Statistics")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Sales Statistics',
                                FRB='Statistiques vente',
                                NLB='Verkoopstatistiek';
                    Image = "Report";
                    RunObject = Report "Sales Statistics";
                    ToolTipML = ENU='View customers'' total costs, sales, and profits over time, for example, to analyze earnings trends. The report shows amounts for original and adjusted costs, sales, profits, invoice discounts, payment discounts, and profit percentage in three adjustable periods.',
                                FRB='Afficher les coûts totaux, les ventes et la marge à long terme des clients, par exemple, pour analyser les tendances bénéficiaires. L''état affiche les montants des coûts originaux et ajustés, des ventes, de la marge, de la remise facture et de l''escompte, ainsi que le pourcentage marge sur vente au cours de trois périodes sélectionnables.',
                                NLB='Totale kosten, verkoop en winst van klanten over een periode weergeven, bijvoorbeeld om trends in resultaten te analyseren. Het rapport bevat bedragen voor oorspronkelijke en aangepaste kosten, verkoop, winst, factuurkortingen, contantkortingen en winstpercentages in drie aanpasbare perioden.';
                }
                action("Customer/Item Sales")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer/Item Sales',
                                FRB='Ventes d''articles par client',
                                NLB='Verkoop klant/artikel';
                    Image = "Report";
                    RunObject = Report "Customer/Item Sales";
                    ToolTipML = ENU='View a list of item sales for each customer during a selected time period. The report contains information on quantity, sales amount, profit, and possible discounts. It can be used, for example, to analyze a company''s customer groups.',
                                FRB='Afficher la liste des ventes article de chaque client pendant la période choisie. L''état donne des informations sur la quantité, le montant des ventes, la marge et les remises possibles. Il peut servir, par exemple, à l''analyse des groupes clients d''une société.',
                                NLB='Een overzicht weergeven van artikelverkopen per klant tijdens een geselecteerde periode. In het rapport vindt u gegevens over aantallen, verkoopbedragen, winstbedragen en mogelijke kortingen. Met het rapport kunt u bijvoorbeeld de klantengroepen van een bedrijf analyseren.';
                }
            }
            group(Finance)
            {
                CaptionML = ENU='Finance',
                            FRB='Finance',
                            NLB='Financiering';
                Image = "Report";
                action("Customer - Detail Trial Bal.")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Detail Trial Bal.',
                                FRB='Clients : Grand livre client',
                                NLB='Klant - Historiek';
                    Image = "Report";
                    RunObject = Report "Customer - Detail Trial Bal.";
                    ToolTipML = ENU='View the balance for customers with balances on a specified date. The report can be used at the close of an accounting period, for example, or for an audit.',
                                FRB='Afficher le solde des clients présentant des soldes à une date donnée. L''état peut être utilisé à la clôture d''une période comptable, par exemple, ou pour un audit.',
                                NLB='Het saldo weergeven van klanten waarvoor op een bepaalde datum saldi bestaan. Het rapport kan bijvoorbeeld worden gebruikt bij het afsluiten van een boekingsperiode of voor een controle.';
                }
                action("Customer - Summary Aging")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Summary Aging',
                                FRB='Clients : Échéancier',
                                NLB='Klant - Open posten';
                    Image = "Report";
                    RunObject = Report "Customer - Summary Aging";
                    ToolTipML = ENU='View, print, or save a summary of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.',
                                FRB='Afficher, imprimez ou enregistrez un résumé des totaux dus de chaque client, divisé en trois périodes. Cet état sert à décider quand émettre des relances, à évaluer la solvabilité d''un client ou à préparer des analyses de liquidités.',
                                NLB='Een in drie perioden onderverdeeld overzicht weergeven, afdrukken of opslaan van het totaal aan openstaande betalingen van elke klant. Dit rapport kan worden gebruikt om te besluiten wanneer aanmaningen moeten worden verzonden, om de kredietwaardigheid van een klant te evalueren of om liquiditeitsanalyses voor te bereiden.';
                }
                action("Customer Detailed Aging")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer Detailed Aging',
                                FRB='Écritures client ouvertes',
                                NLB='Klant - Vervallen posten';
                    Image = "Report";
                    RunObject = Report "Customer Detailed Aging";
                    ToolTipML = ENU='View a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.',
                                FRB='Afficher la liste détaillée des totaux dus de chaque client, divisée en trois périodes. Cet état sert à décider quand émettre des relances, à évaluer la solvabilité d''un client ou à préparer des analyses de liquidités.',
                                NLB='Een gedetailleerde, in drie perioden verdeelde lijst met het totaal aan openstaande betalingen van elke klant weergeven. Het rapport kan worden gebruikt om te besluiten wanneer er aanmaningen moeten worden verzonden, om de kredietwaardigheid van een klant te evalueren of om liquiditeitsanalyses voor te bereiden.';
                }
                action(Statement)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Statement',
                                FRB='Relevé',
                                NLB='Rekeningoverzicht';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Codeunit "Customer Layout - Statement";
                    ToolTipML = ENU='View a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.',
                                FRB='Afficher la liste des transactions d''un client pour une période sélectionnée, par exemple, à envoyer au client à la clôture d''une période comptable. Vous pouvez choisir d''afficher tous les soldes échus, sans tenir compte de la période spécifiée, ou d''inclure un cumul date.',
                                NLB='Een lijst met transacties van een klant in een bepaalde periode weergeven. Deze lijst kan dan bijvoorbeeld aan het eind van een boekingsperiode naar de klant worden verzonden. U kunt alle openstaande saldi weergeven, ongeacht de opgegeven periode, of u kunt ervoor kiezen een vervaldatuminterval op te nemen.';
                }
                action(Reminder)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Reminder',
                                FRB='Relance',
                                NLB='Aanmaning';
                    Image = Reminder;
                    RunObject = Report Reminder;
                    ToolTipML = ENU='Create a new reminder for the customer.',
                                FRB='Créer une relance pour le client.',
                                NLB='Een nieuwe aanmaning voor de klant maken.';
                }
                action("Aged Accounts Receivable")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Aged Accounts Receivable',
                                FRB='Comptabilité client âgée',
                                NLB='Vervallen vorderingen';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Aged Accounts Receivable";
                    ToolTipML = ENU='View an overview of when customer payments are due or overdue, divided into four periods. You must specify the date you want aging calculated from and the length of the period that each column will contain data for.',
                                FRB='Afficher un aperçu des dates d''échéance des paiements dus au client, divisé en quatre périodes. Vous devez spécifier la date à partir de laquelle vous souhaitez que le cumul soit calculé et la durée de la période pour laquelle chaque colonne contiendra des données.',
                                NLB='Een overzicht weergeven dat is onderverdeeld in vier perioden en waarin wordt aangegeven wanneer betalingstermijnen van klanten vervallen of zijn overschreden. U moet de begindatum opgeven vanaf wanneer het verval moet worden berekend en de lengte van de periode waarin gegevens worden opgenomen in elke kolom.';
                }
                action("Customer - Balance to Date")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Balance to Date',
                                FRB='Clients : Écritures ouvertes',
                                NLB='Klant - Saldo t/m datum';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Customer - Balance to Date";
                    ToolTipML = ENU='View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.',
                                FRB='Afficher une liste reprenant l''historique des paiements des clients jusqu''à une certaine date. Vous pouvez utiliser l''état pour extraire vos revenus de vente totaux à la clôture d''une période comptable ou d''un exercice.',
                                NLB='Een lijst met de betalingshistoriek van klanten tot een bepaalde datum weergeven. U kunt het rapport gebruiken om er bij de afsluiting van een boekingsperiode of boekjaar uw totale omzet uit te extraheren.';
                }
                action("Customer - Trial Balance")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Trial Balance',
                                FRB='Clients : Balance',
                                NLB='Klant - Proefbalans';
                    Image = "Report";
                    RunObject = Report "Customer - Trial Balance";
                    ToolTipML = ENU='View the beginning and ending balance for customers with entries within a specified period. The report can be used to verify that the balance for a customer posting group is equal to the balance on the corresponding general ledger account on a certain date.',
                                FRB='Afficher le solde d''ouverture et final pour les clients présentant des écritures au cours d''une période spécifiée. L''état peut être utilisé pour vérifier que le solde pour un groupe comptabilisation client est égal à celui du compte général correspondant à une certaine date.',
                                NLB='Het begin- en eindsaldo voor klanten met posten binnen een opgegeven periode weergeven. Met dit rapport kunt u controleren of het saldo van een klantboekingsgroep op een bepaalde datum gelijk is aan het saldo van de bijbehorende grootboekrekening.';
                }
                action("Customer - Payment Receipt")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customer - Payment Receipt',
                                FRB='Reçu paiement client',
                                NLB='Klant - Betalingsontvangst';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Customer - Payment Receipt";
                    ToolTipML = ENU='View a document showing which customer ledger entries that a payment has been applied to. This report can be used as a payment receipt that you send to the customer.',
                                FRB='Afficher un document présentant les écritures comptables client avec lesquelles un paiement a été lettré. Cet état peut être utilisé comme reçu de paiement à envoyer au client.',
                                NLB='Een document weergeven dat aangeeft met welke klantenposten een betaling is vereffend. Dit rapport kan worden gebruikt als betalingsontvangst die u naar de klant stuurt.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement : Codeunit "CRM Coupling Management";
        WorkflowWebhookManagement : Codeunit "Workflow Webhook Management";
    begin
        SetSocialListeningFactboxVisibility;

        CRMIsCoupledToRecord :=
          CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID) and CRMIntegrationEnabled;
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);

        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

        WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);

        // Contextual Power BI FactBox: send data to filter the report in the FactBox
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection("No.",false);

        SetWorkflowManagementEnabledState;
    end;

    trigger OnInit();
    begin
        SetCustomerNoVisibilityOnFactBoxes;

        CaptionTxt := CurrPage.CAPTION;
        SetCaption(CaptionTxt);
        CurrPage.CAPTION(CaptionTxt);
    end;

    trigger OnOpenPage();
    var
        CRMIntegrationManagement : Codeunit "CRM Integration Management";
        CustomerMgt : Codeunit "Customer Mgt.";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;

        SetWorkflowManagementEnabledState;
        SETFILTER("Date Filter",CustomerMgt.GetCurrentYearFilter);

        // Contextual Power BI FactBox: filtering available reports, setting context, loading Power BI related user settings
        CurrPage."Power BI Report FactBox".PAGE.SetNameFilter(CurrPage.CAPTION);
        CurrPage."Power BI Report FactBox".PAGE.SetContext(CurrPage.OBJECTID(false));
        PowerBIVisible := SetPowerBIUserConfig.SetUserConfig(PowerBIUserConfiguration,CurrPage.OBJECTID(false));
    end;

    var
        PowerBIUserConfiguration : Record "Power BI User Configuration";
        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
        SetPowerBIUserConfig : Codeunit "Set Power BI User Config";
        SocialListeningSetupVisible : Boolean;
        SocialListeningVisible : Boolean;
        CRMIntegrationEnabled : Boolean;
        CRMIsCoupledToRecord : Boolean;
        OpenApprovalEntriesExist : Boolean;
        CanCancelApprovalForRecord : Boolean;
        EnabledApprovalWorkflowsExist : Boolean;
        PowerBIVisible : Boolean;
        CanRequestApprovalForFlow : Boolean;
        CanCancelApprovalForFlow : Boolean;
        EventFilter : Text;
        CaptionTxt : Text;

    [Scope('Personalization')]
    procedure GetSelectionFilter() : Text;
    var
        Cust : Record Customer;
        SelectionFilterManagement : Codeunit SelectionFilterManagement;
    begin
        CurrPage.SETSELECTIONFILTER(Cust);
        exit(SelectionFilterManagement.GetSelectionFilterForCustomer(Cust));
    end;

    [Scope('Personalization')]
    procedure SetSelection(var Cust : Record Customer);
    begin
        CurrPage.SETSELECTIONFILTER(Cust);
    end;

    local procedure SetSocialListeningFactboxVisibility();
    var
        SocialListeningMgt : Codeunit "Social Listening Management";
    begin
        SocialListeningMgt.GetCustFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;

    local procedure SetCustomerNoVisibilityOnFactBoxes();
    begin
        CurrPage.SalesHistSelltoFactBox.PAGE.SetCustomerNoVisibility(false);
        CurrPage.SalesHistBilltoFactBox.PAGE.SetCustomerNoVisibility(false);
        CurrPage.CustomerDetailsFactBox.PAGE.SetCustomerNoVisibility(false);
        CurrPage.CustomerStatisticsFactBox.PAGE.SetCustomerNoVisibility(false);
    end;

    local procedure SetWorkflowManagementEnabledState();
    var
        WorkflowManagement : Codeunit "Workflow Management";
        WorkflowEventHandling : Codeunit "Workflow Event Handling";
    begin
        EventFilter := WorkflowEventHandling.RunWorkflowOnSendCustomerForApprovalCode + '|' +
          WorkflowEventHandling.RunWorkflowOnCustomerChangedCode;

        EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::Customer,EventFilter);
    end;

    [IntegrationEvent(false, false)]
    procedure SetCaption(var InText : Text);
    begin
    end;
}

