var maxChannels = 256;

show_debug_message("Obj_Fmod::Create")

var _max_channels = 256
var _flags_core = FMOD_INIT.NORMAL;
var _flags_studio = FMOD_STUDIO_INIT.LIVEUPDATE;

#macro USE_DEBUG_CALLBACKS false

if (USE_DEBUG_CALLBACKS) {
	fmod_debug_initialize(FMOD_DEBUG_FLAGS.LEVEL_LOG, FMOD_DEBUG_MODE.CALLBACK);
}
fmod_studio_system_create();	
show_debug_message("fmod_studio_system_create: " + string(fmod_last_result()));
	
fmod_studio_system_init(_max_channels, _flags_studio, _flags_core);
fmod_studio_system_set_num_listeners(1);
show_debug_message("fmod_studio_system_init: " + string(fmod_last_result()));
	
/*
	FMOD Studio will create an initialize an underlying core system to work with.
*/
fmod_main_system = fmod_studio_system_get_core_system();

var _bank_files = [
    "sound\\Desktop\\Master.bank",
    "sound\\Desktop\\music.bank",
    "sound\\Desktop\\sfx.bank",
    "sound\\Desktop\\Master.strings.bank"
];

global.fmod_banks = [];

for (var i = 0; i < array_length(_bank_files); i++)
{
	var _file = _bank_files[i];
    var _path = fmod_path_bundle(_file); // from datafiles
	
	show_debug_message("Loading bank metadata: " + _file);
	
	// load the bank metadata and get its handle
    var _bank_handle = fmod_studio_system_load_bank_file(_path, FMOD_STUDIO_LOAD_BANK.NORMAL);
	
	if (_bank_handle == undefined) 
    {
        show_debug_message("failed to load bank metadata: " + _file + ". Result: " + string(fmod_last_result()));
    }
	else
	{
		// save metadata
		array_push(global.fmod_banks, _bank_handle);
		// load the sample data
		fmod_studio_bank_load_sample_data(_bank_handle);
	}
	
}

global.sound_map = ds_map_create();
global.steam_api = false;
global.screenshotcount = 0;
/*
var plat = "Desktop";
var banks = [concat("sound/", plat, "/Master.bank"), concat("sound/", plat, "/music.bank"), concat("sound/", plat, "/sfx.bank"), concat("sound/", plat, "/Master.strings.bank")];
trace("Loading banks! Platform -> ", plat);
for (var i = 0; i < array_length(banks); i++)
{
	var b = working_directory + banks[i];
	trace("Loading bank at: ", b);
	if (fmod_bank_load(b, false))
	{
		trace("Loading bank sample data at: ", b);
		if (!fmod_bank_load_sample_data(b))
		{
			trace("Could not load bank sample data: ", b);
		}
	}
	else
	{
		trace("Could not load bank: ", b);
	}
}

