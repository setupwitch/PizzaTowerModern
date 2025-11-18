// this is a weird mix of the example FMOD object code and my code.
loaded = false;

var _max_channels = 256
var _flags_core = FMOD_INIT.NORMAL;
var _flags_studio = FMOD_STUDIO_INIT.LIVEUPDATE;

// initialize studio
fmod_studio_system_create();	
show_debug_message("fmod_studio_system_create: " + string(fmod_last_result()));

fmod_studio_system_init(_max_channels, _flags_studio, _flags_core);
show_debug_message("fmod_studio_system_init: " + string(fmod_last_result()));

fmod_studio_system_set_num_listeners(1);

// create the core system
fmod_main_system = fmod_studio_system_get_core_system();

// array of relative paths to the bank files
var _bank_files = [
    "sound\\Desktop\\Master.bank",
    "sound\\Desktop\\music.bank",
    "sound\\Desktop\\sfx.bank",
    "sound\\Desktop\\Master.strings.bank"
];
// to store bank handles
global.fmod_banks = [];

var _bank_count = array_length(_bank_files);
for (var i = 0; i < _bank_count; i++)
{
	var _file = _bank_files[i];
    var _path = fmod_path_bundle(_file); // gets full path from relative path
	
	show_debug_message("Loading bank metadata: " + _file);
	
	// load the bank metadata and get its handle
    var _bank_handle = fmod_studio_system_load_bank_file(_path, FMOD_STUDIO_LOAD_BANK.NORMAL);
	
	// if the function failed, it should return undefined.
	if (_bank_handle == undefined) 
    {
        show_debug_message("Failed to load bank metadata: " + _file + ". Result: " + string(fmod_last_result()));
		throw "Failed to load bank metadata! Check log for details.";
    }
	else
	{
		// save metadata
		array_push(global.fmod_banks, _bank_handle);
		// load the sample data
		fmod_studio_bank_load_sample_data(_bank_handle);
        
        if (fmod_studio_bank_get_loading_state(_bank_handle) == FMOD_STUDIO_LOADING_STATE.ERROR)
        {
            show_debug_message("Bank loading error:" + fmod_last_result());
            throw "Bank loading error! Check log for details.";
        }

	}
	
}

global.sound_map = ds_map_create();
global.steam_api = false;
global.screenshotcount = 0;
global.active_sounds = [];

loaded = true;