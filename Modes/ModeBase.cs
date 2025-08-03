using CaaLab.Exceptions;
using Godot;
using System;

namespace CaaLab;

[GlobalClass]
public partial class ModeBase : Control, ICreatable<ModeBase>
{
	public static ModeBase Create()
	{
		throw new NonCreatableException();
	}
}
