import yt
yt.enable_parallelism()
from yt.mods import * # set up our namespace
from yt.utilities.physical_constants import mp
mu = 1.3 # set mu to whatever your mean molecular weight is
ds = load("J1e4/DD0014/data0014")

@derived_field(name='NumberDensity',units="1/cm**3")
def _NumberDensity(field, data):
    return data["density"]/(mu*mp)
ds.add_field("NumberDensity", function=_NumberDensity, units="1/cm**3")

ad = ds.h.all_data()
sp = ds.sphere("max", (1, "kpc"))
halo_mass = sp.quantities.total_mass().in_units('Msun')

plot = yt.PhasePlot(sp, "NumberDensity", "temperature", "cell_mass",
                    weight_field=None)
plot.set_unit("NumberDensity","cm**-3")
plot.set_unit("cell_mass","msun")
plot.save()

