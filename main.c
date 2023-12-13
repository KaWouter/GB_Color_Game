#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <gb/gb.h>

const unsigned char smile[] =
{
  0x3C,0x3C,0x42,0x42,0x81,0x81,0xA5,0xA5,
  0x81,0x81,0x81,0xA5,0x42,0x5A,0x3C,0x3C
};

void main(){
	
	uint8_t joydata;
	uint8_t x = 55; // Our beginning x coord
	uint8_t y = 75; // Our beginning y coord
	
	SPRITES_8x8;

	set_sprite_data(0, 1, smile);
	set_sprite_tile(0, 0);
	move_sprite(0, x, y); // Move sprite to our predefined x and y coords

	SHOW_SPRITES;

	while(1){
		joydata = joypad(); // Read once per frame and cache the result

		if (joydata & J_RIGHT) // If RIGHT is pressed
		{
			x++;
			move_sprite(0,x,y); // move sprite 0 to x and y coords
		}
		
		if (joydata & J_LEFT)  // If LEFT is pressed
		{
			x--;
			move_sprite(0,x,y); // move sprite 0 to x and y coords
		}
		
		if (joydata & J_UP)  // If UP is pressed
		{ 
			y--;
			move_sprite(0,x,y); // move sprite 0 to x and y coords
		}
		
		if (joydata & J_DOWN)  // If DOWN is pressed
		{ 
			y++;
			move_sprite(0,x,y); // move sprite 0 to x and y coords
		}
	
		wait_vbl_done(); // Idle until next frame
	}
}