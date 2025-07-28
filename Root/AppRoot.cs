using Godot;
using System;

namespace CaaLab;

[GlobalClass]
public partial class AppRoot : Control
{
	public static AppRoot Instance;
	public static Preferences Prefs;

	public AppRoot()
	{
		Instance = this;
	}
}
