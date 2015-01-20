#include "CApp.h"

CApp::CApp()
{
	CurrentPlayer = 0;
	
	Surf_Grid = NULL;
	Surf_X = NULL;
	Surf_O = NULL;

	Surf_Display = NULL;
	
	Running = true;

	WinsX = 0;
	WinsO = 0;
}

int CApp::OnExecute() {
	if(OnInit() == false) {
		return -1;
	}

	SDL_Event Event;

	while(Running)
	{
	  while(SDL_PollEvent(&Event)) 
	  {
	    OnEvent(&Event);
	  }

	  OnLoop();
	  OnRender();
	}
	
	OnCleanup();
	
	return 0;
}

void CApp::Reset()
{
	for(int i=0; i<9; i++)
	{
	  Grid[i] = GRID_TYPE_NONE;
	}
}

int main(int argc, char* argv[]) {
	CApp theApp;

	return theApp.OnExecute();
}

void CApp::SetCell(int ID, int Type)
{
	if(ID < 0 || ID >=9) return;
	if(Type < 0 || Type > GRID_TYPE_O) return;

	Grid[ID] = Type;
}

void CApp::SetWinner()
{
	int Winner = 0;
	
	if(Grid[0] == Grid[1] && Grid[1] == Grid[2] && Grid[2] != GRID_TYPE_NONE)
	{
	  Winner = Grid[0];
	}
	if(Grid[3] == Grid[4] && Grid[4] == Grid[5] && Grid[5] != GRID_TYPE_NONE)
	{
	  Winner = Grid[3];
	}
	if (Grid[6] == Grid[7] && Grid[7] == Grid[8] && Grid[8] != GRID_TYPE_NONE) 
	{
	  Winner = Grid[6];
	}
	if (Grid[0] == Grid[3] && Grid[3] == Grid[6] && Grid[6] != GRID_TYPE_NONE) 
	{
	  Winner = Grid[0];
	}
	if (Grid[1] == Grid[4] && Grid[4] == Grid[7] && Grid[7] != GRID_TYPE_NONE) 
	{
	  Winner = Grid[1];
	}
	if (Grid[2] == Grid[5] && Grid[5] == Grid[8] && Grid[8] != GRID_TYPE_NONE) 
	{
	  Winner = Grid[2];
	}
	if (Grid[0] == Grid[4] && Grid[4] == Grid[8] && Grid[8] != GRID_TYPE_NONE) 
	{
	  Winner = Grid[0];
	}
	if (Grid[2] == Grid[4] && Grid[4] == Grid[6] && Grid[6] != GRID_TYPE_NONE) 
	{
	  Winner = Grid[2];
	}
	if (Winner != 0) CongratWinner(Winner);
}

void CApp::CongratWinner(int Winner)
{
	if (Winner == 1)
	{
	  WinsX++;
	  Reset();
	}
	else
	{
	  WinsO++;
	  Reset();
	}
}
