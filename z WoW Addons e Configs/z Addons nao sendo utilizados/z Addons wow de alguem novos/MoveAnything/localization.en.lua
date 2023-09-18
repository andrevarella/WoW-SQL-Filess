local addonname, modRef = ...

_G["MOVANY"] = modRef
MOVANY.RESET_FRAME_CONFIRM = "Reset %s? Press again within 5 seconds to confirm"
MOVANY.RESETTING_FRAME = "Resetting %s"
MOVANY.FRAME_PROTECTED_DURING_COMBAT = "Can't interact with %s during combat"
MOVANY.DISABLED_DURING_COMBAT = "Disabled during combat"
MOVANY.UNSUPPORTED_TYPE = "Unsupported type: %s"
MOVANY.UNSUPPORTED_FRAME = "Unsupported frame: %s"
MOVANY.FRAME_VISIBILITY_ONLY = "%s can only be hidden"
MOVANY.ONLY_WHEN_VISIBLE = "%s can only be modified while it's shown on the screen"
MOVANY.FRAME_NO_FRAME_EDITOR = "Frame editors is disabled for %s"
MOVANY.ELEMENT_NOT_FOUND = "UI element not found"
MOVANY.ELEMENT_NOT_FOUND_NAMED = "UI element not found: %s"
MOVANY.PROFILES_CANT_SWITCH_DURING_COMBAT = "Profiles can't be switched during combat"
MOVANY.CMD_SYNTAX_UNMOVE = "Syntax: /unmove frameName"
MOVANY.CMD_SYNTAX_IMPORT = "Syntax: /moveimport ProfileName"
MOVANY.CMD_SYNTAX_EXPORT = "Syntax: /moveexport ProfileName"
MOVANY.CMD_SYNTAX_DELETE = "Syntax: /movedelete ProfileName"
MOVANY.CMD_SYNTAX_MAFE = "Syntax: /mafe frameName"
MOVANY.CMD_SYNTAX_HIDE = "Syntax: /hide ProfileName"
MOVANY.RESET_ALL_CONFIRM = "MoveAnything: Reset MoveAnything to installation state?\n\nWarning: this will delete all frame settings and clear out the custom frame list."
MOVANY.PROFILE_UNKNOWN = "Unknown profile: %s"
MOVANY.PROFILE_IMPORTED = "\"%s\" has been imported into \"%s\""
MOVANY.PROFILE_EXPORTED = "\"%s\" exported to \"%s\""
MOVANY.PROFILE_DELETED = "Profile deleted: %s"
MOVANY.PROFILE_RESET_CONFIRM = "MoveAnything: Reset all frames in the current profile?"
MOVANY.PROFILE_CANT_DELETE_CURRENT_IN_COMBAT = "Can't delete current profile during combat"
MOVANY.PROFILES = "Profiles"
MOVANY.PROFILE_CURRENT = "Current"
MOVANY.FRAME_UNPOSITIONED = "%s is currently unpositioned and can't be moved till it is"
MOVANY.NO_NAMED_FRAMES_FOUND = "No named elements found"
MOVANY.SEARCH_TEXT = "Search    "
MOVANY.LIST_HEADING_CATEGORY_AND_FRAMES = "Categories and Frames"
MOVANY.LIST_HEADING_SEARCH_RESULTS = "Search results: %i"
MOVANY.LIST_HEADING_HIDE = "Hide"
MOVANY.LIST_HEADING_MOVER = "Mover"
MOVANY.FE_UNREGISTER_ALL_EVENTS_CONFIRM = "Unregister all events? Click again within 5 seconds to confirm"
MOVANY.FE_UNREGISTER_ALL_EVENTS_TOOLTIP = "Unregisters any events that the frame is listening to,\nrendering the frame inert\n\nRe-enabling unregistered events will require a reload\nor relog after unchecking this checkbox"
MOVANY.FRAME_ONLY_WHEN_BANK_IS_OPEN = "Can only interact with %s while the bank is open"
MOVANY.FRAME_ONLY_ONCE_OPENED = "Can only interact with %s once it has been shown"
MOVANY.PROFILE_ADD_TEXT = "Enter new profile name"
MOVANY.PROFILE_SAVE_AS_TEXT = "Enter new profile name"
MOVANY.PROFILE_RENAME_TEXT = "Enter new name for \"%s\""
MOVANY.PROFILE_DELETE_TEXT = "Delete profile \"%s\"?"
MOVANY.PROFILE_ALREADY_EXISTS = "Profile \"%s\" already exists"
MOVANY.PROFILE_CANT_DELETE = "Profile \"%s\" can't be deleted"
MOVANY.ADD = "Add"
MOVANY.SAVE = "Save"
MOVANY.RENAME ="Rename"
MOVANY.DELETE = "Delete"
MOVANY.UNSERIALIZE_PROFILE_NO_NAME = "Unable to locate profile name"
MOVANY.UNSERIALIZE_PROFILE_COMPLETED = "Imported %i element(s) into profile \"%s\""
MOVANY.UNSERIALIZE_FRAME_INVALID_FORMAT = "Invalid format"
MOVANY.UNSERIALIZE_FRAME_NAME_DIFFERS = "Imported frame name differs from import target"
MOVANY.FE_FORCED_LOCK_POSITION_CONFIRM = "Force position lock? Click again within 5 seconds to confirm"
MOVANY.FE_FORCED_LOCK_POSITION_TOOLTIP = "Overwrites the element's SetPoint method,\nreplacing it with an empty stub\n\nMay cause taint if the element is protected\nand the stub gets called during combat\n\nRequires a reload or relog after unchecking to\nrestore the original SetPoint method"
MOVANY.FE_GROUP_RESET_CONFIRM = "Reset Group %i? Click again within 5 seconds to confirm"
MOVANY.FE_GROUPS_TOOLTIP = "Group %i"