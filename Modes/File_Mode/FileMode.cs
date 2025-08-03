using Godot;
using System;

namespace CaaLab;

[GlobalClass]
public partial class FileMode : ModeBase, ICreatable<FileMode>
{
	static FileMode ICreatable<FileMode>.Create()
	{
		throw new NotImplementedException();
	}
}
