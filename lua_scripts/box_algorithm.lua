link_holes = ZomGet("Vars.AutoSelect.LinkHoles")
cut_handles = ZomGet("Vars.AutoSelect.CutHandles")

ZomSelect({PrimType="Edge", WorkingSet="Visible", Select=true, ResetBefore=true, ProtectMapName="Protect", FilterIslandVisible=true, Auto={Box={ActiveEdges={ "XPYP", "XPZP", "XPYM", "XPZM", "YPZP", "YMZP", "YMZM", "YPZM", "XMYP", "XMZP", "XMYM", "XMZM" }}, PipesCutter=link_holes, HandleCutter=cut_handles, StoreCoordsUVW=true, FlatteningMode=2}})
ZomCut({PrimType="Edge", WorkingSet="Visible"})
ZomLoad({Data={CoordsUVWInternalPath="Mesh.Tmp.AutoSelect.UVW"}})
ZomIslandGroups({Mode="DistributeInTilesByBBox", WorkingSet="Visible", MergingPolicy=8322})
ZomIslandGroups({Mode="DistributeInTilesEvenly", WorkingSet="Visible", MergingPolicy=8322, UseTileLocks=true, UseIslandLocks=true})
ZomPack({ProcessTileSelection=false, RecursionDepth=1, RootGroup="RootGroup", WorkingSet="Visible", Scaling={Mode=2}, Rotate={}, Translate=true, LayoutScalingMode=2})
