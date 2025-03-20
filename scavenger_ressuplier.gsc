#include maps\mp\_utility;

Init()
{
    InitScavengerResupply();
}

InitScavengerResupply()
{
    level thread OnPlayerConnect();
}

OnPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);

        player thread OnPlayerSpawned();
    }
}

OnPlayerSpawned()
{
    self endon("disconnect");
    
    for(;;)
    {
        self waittill("changed_kit");

        // Check if the player has the Scavenger perk
        if (self HasPerk("specialty_scavenger"))
        {
            self thread OnScavengerPickup();
        }
    }
}

OnScavengerPickup()
{
    self endon("disconnect");
    self endon("death");

    for (;;)
    {
        self waittill("scavenger_pickup");

        self GiveMaxAmmo();

        if (self HasWeapon(self GetCurrentOffhand()))
        {
            self GiveMaxAmmo(self GetCurrentOffhand());
        }

        if (self GetWeaponAmmoStock("frag_grenade_mp") < 1)
        {
            self SetWeaponAmmoStock("frag_grenade_mp", 1);
        }
	if (self GetWeaponAmmoStock("semtex_mp") < 1)
        {
            self SetWeaponAmmoStock("semtex_mp", 1);
        }
	if (self GetWeaponAmmoStock("throwingknife_mp") < 1)
        {
            self SetWeaponAmmoStock("throwingknife_mp", 1);
        }
	if (self GetWeaponAmmoStock("bouncingbetty_mp") < 1)
        {
            self SetWeaponAmmoStock("bouncingbetty_mp", 1);
        }
	if (self GetWeaponAmmoStock("claymore_mp") < 1)
        {
            self SetWeaponAmmoStock("claymore_mp", 1);
        }
	if (self GetWeaponAmmoStock("c4_mp") < 1)
        {
            self SetWeaponAmmoStock("c4_mp", 1);
        }
        if (self GetWeaponAmmoStock("flash_grenade_mp") < 1)
        {
            self SetWeaponAmmoStock("flash_grenade_mp", 1);
        }
        if (self GetWeaponAmmoStock("concussion_grenade_mp") < 1)
        {
            self SetWeaponAmmoStock("concussion_grenade_mp", 1);
        }
	if (self GetWeaponAmmoStock("scrambler_mp") < 1)
        {
            self SetWeaponAmmoStock("scrambler_mp", 1);
        }
	if (self GetWeaponAmmoStock("emp_grenade_mp") < 1)
        {
            self SetWeaponAmmoStock("emp_grenade_mp", 1);
        }
	if (self GetWeaponAmmoStock("smoke_grenade_mp") < 1)
        {
            self SetWeaponAmmoStock("smoke_grenade_mp", 1);
        }
	if (self GetWeaponAmmoStock("trophy_mp") < 1)
        {
            self SetWeaponAmmoStock("trophy_mp", 1);
        }
	if (self GetWeaponAmmoStock("portable_radar_mp") < 1)
        {
            self SetWeaponAmmoStock("portable_radar_mp", 1);
        }

        self thread ResupplyLaunchers();
    }
}

ResupplyLaunchers()
{
    launchers = [
        "m320_mp",
        "rpg_mp",
        "iw5_smaw_mp",
        "stinger_mp",
        "xm25_mp",
        "javelin_mp"
    ];

    for (i = 0; i < launchers.size; i++)
    {
        weapon = launchers[i];

        if (self HasWeapon(weapon))
        {
            self GiveMaxAmmo(weapon);
        }
    }
}
