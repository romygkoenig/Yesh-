import "bootstrap";
import 'select2/dist/css/select2.css';
import "../plugins/init_flatpickr"
import { initStarRating } from '../plugins/init_star_rating';
import { initSelect2 } from '../components/init_select2';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../plugins/init_autocomplete';


initSelect2();
initStarRating();
initMapbox();
initAutocomplete();
