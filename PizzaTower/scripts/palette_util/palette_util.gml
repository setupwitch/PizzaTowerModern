function get_pep_palette_info()
{
	if (global.swapmode)
	{
		var pal = 1;
		return 
		{
			spr_palette: spr_peppalette,
			paletteselect: obj_player.player_paletteselect[pal],
			patterntexture: obj_player.player_patterntexture[pal]
		};
	}
	else if (obj_savesystem.ispeppino)
	{
		return 
		{
			spr_palette: obj_player.spr_palette,
			paletteselect: obj_player.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return 
	{
		spr_palette: spr_peppalette,
		paletteselect: 1,
		patterntexture: noone
	};
}

function get_noise_palette_info()
{
	if (global.swapmode)
	{
		var pal = 0;
		return 
		{
			spr_palette: spr_noisepalette,
			paletteselect: obj_player.player_paletteselect[pal],
			patterntexture: obj_player.player_patterntexture[pal]
		};
	}
	else if (!obj_savesystem.ispeppino)
	{
		return 
		{
			spr_palette: obj_player.spr_palette,
			paletteselect: obj_player.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return 
	{
		spr_palette: spr_noisepalette,
		paletteselect: 1,
		patterntexture: noone
	};
}
