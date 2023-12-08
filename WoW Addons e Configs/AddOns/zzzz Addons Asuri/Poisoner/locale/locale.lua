
-- 
-- Regular expressions to match poison names
-- 
Poisoner_Patterns = {
	"%w+ Sharpening Stone",
	"%w+ Weightstone",
	".*Mana Oil",
	".*Wizard Oil",
	"Frost Oil",
	"Shadow Oil",
        ".*Poison%s*([IVX]*)"
};

--
-- Other internal strings
--

-- the pattern to search for in a tooltip for the number of charges
-- remaining on an expendable item
POISONER_PATTERN_CHARGES = "^(%d+) Charges$";

--
-- Display strings
--

-- tooltip strings
POISONER_MINIMAPBUTTON_TIP1 = "Poisoner";
-- error messages
POISONER_COMMANDERROR = "Unknown poisoner command: ";
POISONER_DRAGERROR = "Error dragging poisoner button";
POISONER_POSITIONERROR = "Unknown position option";
