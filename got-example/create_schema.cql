// Blank slate
START r=relationship(*) delete r;
START n=node(*) delete n;

CREATE
    (Stark:House { name: "House Stark", motto: "Winter Is Comming" }),
    (Tully:House { name: "House Tully", motto: "Family, Duty, Honor" }),
    (Baratheon:House { name: "House Baratheon", motto: "Ours The Fury" }),
    (Arryn:House { name: "House Arryn", motto: "As High As Honor" }),
    (Lannister:House { name: "House Lannister", motto: "Hear My Roar" }),
    (Targaryen:House { name: "House Lannister", motto: "Fire and Blood" });

START 
    Stark=node:node_auto_index(name="House Stark"),
CREATE
    (RickardStark:Person { name: "Rickard Stark" }),
    (UnknownWoman:Person { name: "Unknown Woman" }),
    (RickardStark) -[:HOUSE]-> (Stark),

    (BrandonStark:Person { name: "Brandon Stark" }),
    (LyannaStark:Person { name: "Lyanna Stark" }),
    (BenjenStark:Person { name: "Benjen Stark" }),
    (EddardStark:Person { name: "Eddard Stark" }),

    (RickardStark) <-[:FATHER]- (BrandonStark) -[:MOTHER]-> (UnknownWoman),
    (RickardStark) <-[:FATHER]- (LyannaStark) -[:MOTHER]-> (UnknownWoman),
    (RickardStark) <-[:FATHER]- (BenjenStark) -[:MOTHER]-> (UnknownWoman),
    (RickardStark) <-[:FATHER]- (EddardStark) -[:MOTHER]-> (UnknownWoman);

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
    (EddardStark) <-[:FATHER]- (BrandonStark) -[:MOTHER]-> (CatelynTully),
    (EddardStark) <-[:FATHER]- (RickonStark) -[:MOTHER]-> (CatelynTully),
    (EddardStark) <-[:FATHER]- (JonSnow);

START
    Targaryen=node:node_auto_index(name="House Targaryen")
CREATE
    (Aegon5Targaryen:Person { name: "Aegon V Targaryen" }),
    (Aegon5Targaryen) -[:HOUSE]-> (Targaryen),

    (DuncanTargaryen:Person { name: "Duncan Targaryen" }),
    (Jaehaerys2Targaryen:Person { name: "Jaehaerys II Targaryen" }),
    (RhaelleTargaryen:Person { name: "Rhaelle Targaryen" }),
    (Aerys2Targaryen:Person { name: "Aerys II Targaryen" }),
    (RhaellaTargaryen:Person { name: "Rhaella Targaryen" }),
    (RhaegarTargaryen:Person { name: "Rhaegar Targaryen" }),
    (Viserys3Targaryen:Person { name: "Viserys III Targaryen" }),
    (DaenerysTargaryen:Person { name: "Daenerys Targaryen" }),
    (EliaMartel { name: "Elia Martell" }),
    (RhaenysTargaryen { name: "Rhaenys Targaryen" }),
    (AegonTargaryen { name: "Aegon Targaryen" }),

    (DuncanTargaryen) -[:FATHER]-> (Aegon5Targaryen),
    (Jaehaerys2Targaryen) -[:FATHER]-> (Aegon5Targaryen),
    (RhaelleTargaryen) -[:FATHER]-> (Aegon5Targaryen),

    (Aerys2Targaryen) -[:FATHER]-> (Jaehaerys2Targaryen),
    (RhaelleTargaryen) -[:FATHER]-> (Jaehaerys2Targaryen),

    (RhaegarTargaryen) -[:FATHER]-> (Aerys2Targaryen),
    (Viserys3Targaryen) -[:FATHER]-> (Aerys2Targaryen),
    (DaenerysTargaryen) -[:FATHER]-> (Aerys2Targaryen),
    
    (RhaegarTargaryen) -[:MOTHER]-> (RhaelleTargaryen),
    (Viserys3Targaryen) -[:MOTHER]-> (RhaelleTargaryen),
    (DaenerysTargaryen) -[:MOTHER]-> (RhaelleTargaryen);
    


