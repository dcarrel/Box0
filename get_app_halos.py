import yt
from yt.extensions.astro_analysis.halo_analysis import HaloCatalog
halos_ds = yt.load('halo_catalogs/halos_0.0.bin')
data_ds = yt.load('RD0002/RedshiftOutput0002')

hc = HaloCatalog(data_ds=data_ds, halos_ds = halos_ds)
#Redshift is z=6
#To get temperatures in a range Tmin = 8000K and Tmax = 15000K, we need Mmin = 7.5E7 and Mmax = 1.9E8
hc.add_filter('quantity_value', 'particle_mass', '>', 3.9e7, 'Msun')
hc.add_filter('quantity_value', 'particle_mass', '<', 1e8, 'Msun')

hc.create()
halos_ds = yt.load('halo_catalogs/halos_0/halos_0.0.h5')
hc = HaloCatalog(halos_ds = halos_ds, data_ds = data_ds)
p = yt.ProjectionPlot(data_ds, "x", "all_density")
p.annotate_halos(hc, annotate_field="particle_identifier")
p.save("reduced.png")
