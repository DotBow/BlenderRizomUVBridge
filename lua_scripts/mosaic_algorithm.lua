segments = ZomGet("Vars.AutoSelect.Mosaic.Developability")
link_holes = ZomGet("Vars.AutoSelect.LinkHoles")
cut_handles = ZomGet("Vars.AutoSelect.CutHandles")

ZomSet({Path="Vars.EditMode.ElementMode", Value=1})
ZomSelect({PrimType="Edge", WorkingSet="Visible", Select=true, All=true})
ZomMove({WorkingSet="Visible", PrimType="Edge", Mode="TransformIslandsByEdgePairs"})
ZomWeld({PrimType="Edge", WorkingSet="Visible", Mode="All"})
ZomResetTo3d({WorkingSet="Visible", Rescale=true})

ZomSelect({PrimType="Edge", WorkingSet="Visible", Select=true, ResetBefore=true, ProtectMapName="Protect", FilterIslandVisible=true, Auto={QuasiDevelopable={Developability=segments, IslandPolyNBMin=1, FitCones=false, Straighten=true}, PipesCutter=link_holes,  HandleCutter=cut_handles, StoreCoordsUVW=true, FlatteningMode=0, FlatteningUnfoldParams={Iterations=1, BorderIntersections=true, TriangleFlips=true}}})
ZomCut({PrimType="Edge", WorkingSet="Visible"})
ZomLoad({Data={CoordsUVWInternalPath="Mesh.Tmp.AutoSelect.UVW"}})
ZomIslandGroups({Mode="DistributeInTilesByBBox", WorkingSet="Visible", MergingPolicy=8322})
ZomIslandGroups({Mode="DistributeInTilesEvenly", WorkingSet="Visible", MergingPolicy=8322, UseTileLocks=true, UseIslandLocks=true})
ZomPack({ProcessTileSelection=false, RecursionDepth=1, RootGroup="RootGroup", WorkingSet="Visible", Scaling={Mode=2}, Rotate={}, Translate=true, LayoutScalingMode=2})

