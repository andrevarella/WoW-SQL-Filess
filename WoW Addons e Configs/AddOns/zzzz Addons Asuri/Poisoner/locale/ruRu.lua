if  (GetLocale() == "ruRU") then
-- 
-- Regular expressions to match poison names
-- 
Poisoner_Patterns = {
	"%w+ точило",
	"%w+ грузило",
	".*масло маны",
	".*волшебное масло",
	"Масло льда",
	"Масло Тьмы",
        ".*яд%s*([IVX]*)"
};

--
-- Other internal strings
--

-- the pattern to search for in a tooltip for the number of charges
-- remaining on an expendable item
POISONER_PATTERN_CHARGES = "^(%d+) зарядов$";

--
-- Display strings
--

-- tooltip strings
POISONER_MINIMAPBUTTON_TIP1 = "Poisoner";
-- error messages
POISONER_COMMANDERROR = "Неизвестная команда Poisoner: ";
POISONER_DRAGERROR = "Ошибка перемещения кнопки Poisoner";
POISONER_POSITIONERROR = "Неизвестная ошибка позиционирования";

end
