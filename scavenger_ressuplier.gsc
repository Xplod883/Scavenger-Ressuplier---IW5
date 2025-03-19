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

/*
Handle Scavenger pickups to resupply secondary weapons, lethals, and tacticals
*/
OnScavengerPickup()
{
    self endon("disconnect");
    self endon("death");

    for (;;)
    {
        // Wait for the player to pick up a Scavenger bag
        self waittill("scavenger_pickup");

        // Resupply primary weapon ammo (default behavior)
        self GiveMaxAmmo();

        // Resupply secondary weapon ammo
        if (self HasWeapon(self GetCurrentOffhand()))
        {
            self GiveMaxAmmo(self GetCurrentOffhand());
        }

        // Resupply lethal grenades
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

	

        // Resupply tactical grenades
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
    }
}