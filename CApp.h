#ifndef CAPP_H
#define CAPP_H

#include <SDL/SDL.h>
#include <stdio.h>
#include "CEvent.h"
#include "CSurface.h"

class CApp : public CEvent {
	private:
	bool Running;
	SDL_Surface* Surf_Display;

	private:
	SDL_Surface* Surf_Grid;
	SDL_Surface* Surf_X;
	SDL_Surface* Surf_O;

	private:
	int Grid[9];

	private:
	int WinsX;
	int WinsO;

	enum
	{
	  GRID_TYPE_NONE = 0,
	  GRID_TYPE_X,
	  GRID_TYPE_O
	};
	
	int CurrentPlayer;

	public:
	CApp();
	int OnExecute();

	public:
	bool OnInit();
	void OnEvent(SDL_Event* Event);
	void OnLButtonDown(int mX, int mY);
	void OnRButtonDown(int mX, int mY);
	void OnExit();
	void OnLoop();
	void OnRender();
	void OnCleanup();

	public:
	void Reset();
	void SetCell(int ID, int Type);
	void SetWinner();
	void CongratWinner(int);
};
#endif
