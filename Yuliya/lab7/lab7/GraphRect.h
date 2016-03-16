#pragma once
#include "GraphObject.h"

ref class GraphRect : public GraphObject
{
private:
	int X1, Y1, X2, Y2;
	bool fill;

public:
	GraphRect(Graphics^ _field, int X1, int Y1, int X2, int Y2, bool fill);
	void Drow(Graphics^) override;
};

