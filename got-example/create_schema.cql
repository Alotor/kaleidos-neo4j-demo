// Blank slate
START r=relationship(*) delete r;
START n=node(*) delete n;

CREATE
    (Stark:House { name: "House Stark", motto: "Winter Is Comming" }),
    (Tully:House { name: "House Tully", motto: "Family, Duty, Honor" }),
    (Baratheon:House { name: "House Baratheon", motto: "Ours The Fury" }),
    (Lannister:House { name: "House Lannister", motto: "Hear My Roar" }),
    (Targaryen:House { name: "House Targaryen", motto: "Fire and Blood" });

START 
    Stark=node:node_auto_index(name="House Stark")
CREATE
    (RickardStark:Person { name: "Rickard Stark" }),
    (DarynHornwood:Person { name: "DarynHornwood" }),
    (RickardStark) -[:HOUSE]-> (Stark),

    (BrandonStark:Person { name: "Brandon Stark" }),
    (LyannaStark:Person { name: "Lyanna Stark" }),
    (BenjenStark:Person { name: "Benjen Stark" }),
    (EddardStark:Person { name: "Eddard Stark" }),

    (RickardStark) -[:MARRIED]-> (DarynHornwood) -[:MARRIED]-> (RickardStark),

    (RickardStark) <-[:FATHER]- (BrandonStark) -[:MOTHER]-> (DarynHornwood),
    (RickardStark) <-[:FATHER]- (LyannaStark) -[:MOTHER]-> (DarynHornwood),
    (RickardStark) <-[:FATHER]- (BenjenStark) -[:MOTHER]-> (DarynHornwood),
    (RickardStark) <-[:FATHER]- (EddardStark) -[:MOTHER]-> (DarynHornwood);

START
    EddardStark=node:node_auto_index(name="Eddard Stark"),
    Tully=node:node_auto_index(name="House Tully")
CREATE
    (CatelynTully:Person { name: "Catelyn Tully" }),
    (CatelynTully) -[:HOUSE]-> (Tully),
    (EddardStark) -[:MARRIED]-> (CatelynTully) -[:MARRIED]-> (EddardStark),

    (RobbStark:Person { name: "Robb Stark" }),
    (SansaStark:Person { name: "Sansa Stark" }),
    (JonSnow:Person { name: "Jon Snow" }),
    (AryaStark:Person { name: "Arya Stark" }),
    (BranStark:Person { name: "Bran Stark" }),
    (RickonStark:Person { name: "Rickon Stark" }),

    (EddardStark) <-[:FATHER]- (RobbStark) -[:MOTHER]-> (CatelynTully),
    (EddardStark) <-[:FATHER]- (SansaStark) -[:MOTHER]-> (CatelynTully),
    (EddardStark) <-[:FATHER]- (AryaStark) -[:MOTHER]-> (CatelynTully),
    (EddardStark) <-[:FATHER]- (BranStark) -[:MOTHER]-> (CatelynTully),
    (EddardStark) <-[:FATHER]- (RickonStark) -[:MOTHER]-> (CatelynTully),

    (JonMother:Person { name: "Jon Snow's Mother" }),
    (EddardStark) <-[:FATHER]- (JonSnow) -[:MOTHER]-> (JonMother);

START
    Targaryen=node:node_auto_index(name="House Targaryen")
CREATE
    (Aegon5Targaryen:Person { name: "Aegon V Targaryen" }),
    (Aegon5Targaryen) -[:HOUSE]-> (Targaryen),

    (JayneTargaryen:Person { name: "Jayne Targaryen" }),
    (DuncanTargaryen:Person { name: "Duncan Targaryen" }),
    (Jaehaerys2Targaryen:Person { name: "Jaehaerys II Targaryen" }),
    (AlysanneTargaryen:Person { name: "AlysanneTargaryen" }),
    (RhaelleTargaryen:Person { name: "Rhaelle Targaryen" }),
    (Aerys2Targaryen:Person { name: "Aerys II Targaryen" }),
    (RhaellaTargaryen:Person { name: "Rhaella Targaryen" }),
    (RhaegarTargaryen:Person { name: "Rhaegar Targaryen" }),
    (Viserys3Targaryen:Person { name: "Viserys III Targaryen" }),
    (DaenerysTargaryen:Person { name: "Daenerys Targaryen" }),
    (EliaMartel:Person { name: "Elia Martell" }),
    (RhaenysTargaryen:Person { name: "Rhaenys Targaryen" }),
    (AegonTargaryen:Person { name: "Aegon Targaryen" }),

    (JayneTargaryen) -[:MARRIED]-> (Aegon5Targaryen) -[:MARRIED]-> (JayneTargaryen),
    (JayneTargaryen) <-[:MOTHER]- (DuncanTargaryen) -[:FATHER]-> (Aegon5Targaryen),
    (JayneTargaryen) <-[:MOTHER]- (Jaehaerys2Targaryen) -[:FATHER]-> (Aegon5Targaryen),
    (JayneTargaryen) <-[:MOTHER]- (RhaelleTargaryen) -[:FATHER]-> (Aegon5Targaryen),

    (AlysanneTargaryen) -[:MARRIED]-> (Jaehaerys2Targaryen) -[:MARRIED]-> (Jaehaerys2Targaryen),
    (AlysanneTargaryen) <-[:MOTHER]- (Aerys2Targaryen) -[:FATHER]-> (Jaehaerys2Targaryen),
    (AlysanneTargaryen) <-[:MOTHER]- (RhaellaTargaryen) -[:FATHER]-> (Jaehaerys2Targaryen),

    (RhaellaTargaryen) -[:MARRIED]-> (Aerys2Targaryen) -[:MARRIED]-> (RhaellaTargaryen),
    (RhaellaTargaryen) <-[:MOTHER]- (RhaegarTargaryen) -[:FATHER]-> (Aerys2Targaryen),
    (RhaellaTargaryen) <-[:MOTHER]- (Viserys3Targaryen) -[:FATHER]-> (Aerys2Targaryen),
    (RhaellaTargaryen) <-[:MOTHER]- (DaenerysTargaryen) -[:FATHER]-> (Aerys2Targaryen),
    
    (RhaegarTargaryen) -[:MARRIED]-> (EliaMartel) -[:MARRIED]-> (RhaegarTargaryen),
    (RhaegarTargaryen) <-[:FATHER]- (RhaenysTargaryen) -[:MOTHER]-> (EliaMartel),
    (RhaegarTargaryen) <-[:FATHER]- (AegonTargaryen) -[:MOTHER]-> (EliaMartel);
    
START 
    Lannister=node:node_auto_index(name="House Lannister")
CREATE
    (TywinLannister:Person { name:"Tywin Lannister" }),
    (TywinLannister)-[:HOUSE]->(Lannister),

    (JoannaLannister:Person { name:"Joanna Lannister" }),
    (TywinLannister)-[:MARRIED]->(JoannaLannister)-[:MARRIED]->(TywinLannister),
    (CerseiLannister:Person { name:"Cersei Lannister" }),
    (JaimeLannister:Person { name:"Jaime Lannister" }),
    (TyrionLannister:Person { name:"Tyrion Lannister" }),
    (JoannaLannister)<-[:MOTHER]- (CerseiLannister) -[:FATHER]-> (TywinLannister),
    (JoannaLannister)<-[:MOTHER]- (JaimeLannister) -[:FATHER]-> (TywinLannister),
    (JoannaLannister)<-[:MOTHER]- (TyrionLannister) -[:FATHER]-> (TywinLannister);

START
    Baratheon=node:node_auto_index(name="House Baratheon"),
    CerseiLannister=node:node_auto_index(name="Cersei Lannister"),
    RhaelleTargaryen=node:node_auto_index(name="Rhaelle Targaryen") 
CREATE
    (EdricBaratheon:Person { name:"Edric Baratheon" }),
    (EdricBaratheon)-[:HOUSE]->(Baratheon),
    (SteffonBaratheon:Person { name:"Steffon Baratheon" }),
    (CassanaEstermont:Person { name:"Cassana Estermont" }),
    (RobertBaratheon:Person { name:"Robert Baratheon" }),
    (JoffreyBaratheon:Person { name:"Joffrey Baratheon" }),
    (MyrcellaBaratheon:Person { name:"Myrcella Baratheon" }),
    (TommenBaratheon:Person { name:"Tommen Baratheon" }),
    (DelenaFlorent:Person { name:"Delena Florent" }),
    (EdricStorm:Person { name:"Edric Storm" }),
    (StannisBaratheon:Person { name:"Stannis Baratheon" }),
    (SelyseFlorent:Person { name:"Selyse Florent" }),
    (ShireenBaratheon:Person { name:"Shireen Baratheon" }),
    (RenlyBaratheon:Person { name:"Renly Baratheon" }),

    (EdricBaratheon) -[:MARRIED]-> (RhaelleTargaryen) -[:MARRIED]-> (EdricBaratheon),
    (EdricBaratheon) <-[:FATHER]- (SteffonBaratheon) -[:MOTHER]-> (RhaelleTargaryen),
    (SteffonBaratheon) -[:MARRIED]-> (CassanaEstermont) -[:MARRIED]-> (SteffonBaratheon),
    (SteffonBaratheon) <-[:FATHER]- (RobertBaratheon) -[:MOTHER]-> (CassanaEstermont),
    (SteffonBaratheon) <-[:FATHER]- (RenlyBaratheon) -[:MOTHER]-> (CassanaEstermont),
    (SteffonBaratheon) <-[:FATHER]- (StannisBaratheon) -[:MOTHER]-> (CassanaEstermont),
    (RobertBaratheon) -[:MARRIED]-> (CerseiLannister) -[:MARRIED]-> (RobertBaratheon),
    (StannisBaratheon) -[:MARRIED]-> (SelyseFlorent) -[:MARRIED]-> (StannisBaratheon),

    (CerseiLannister) <-[:MOTHER]- (JoffreyBaratheon) -[:FATHER]-> (RobertBaratheon),
    (CerseiLannister) <-[:MOTHER]- (MyrcellaBaratheon) -[:FATHER]-> (RobertBaratheon),
    (CerseiLannister) <-[:MOTHER]- (TommenBaratheon) -[:FATHER]-> (RobertBaratheon),

    (SelyseFlorent) <-[:MOTHER]- (ShireenBaratheon) -[:FATHER]-> (StannisBaratheon),

    (DelenaFlorent) <-[:MOTHER]- (EdricStorm) -[:FATHER]-> (RobertBaratheon);

START
    RobertBaratheon=node:node_auto_index(name="Robert Baratheon"),
    EddardStark=node:node_auto_index(name="Eddard Stark")
CREATE
    (RobertBaratheon) -[:FRIEND]-> (EddardStark) -[:FRIEND]-> (RobertBaratheon);

START
    JonSnow=node:node_auto_index(name="Jon Snow"),
    TyrionLannister=node:node_auto_index(name="Tyrion Lannister")
CREATE
    (JonSnow) -[:FRIEND]-> (TyrionLannister) -[:FRIEND]-> (JonSnow);

