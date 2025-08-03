using Godot;
using System;

namespace CaaLab;

[GlobalClass]
public partial class DrawingMode : ModeBase, ICreatable<DrawingMode>
{
	static DrawingMode ICreatable<DrawingMode>.Create()
	{
		throw new NotImplementedException();
	}
}
