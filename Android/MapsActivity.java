package com.example.myapplication;

import android.support.v4.app.FragmentActivity;
import android.os.Bundle;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.UiSettings;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.android.gms.maps.model.TileProvider;
import com.google.android.gms.maps.model.UrlTileProvider;
import java.net.MalformedURLException;
import java.net.URL;

public class MapsActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap mMap;
    private UiSettings mUiSettings;

    //TODO: Insert your API key here
    private static final String OPPNADATA_URL =
            "https://api.lantmateriet.se/open/topowebb-ccby/v1/wmts/token/<MY OPEN DATA TOKEN>/1.0.0/topowebb/default/3857/%d/%d/%d.png";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_maps);
        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);
    }


    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;
        mMap.setMapType(GoogleMap.MAP_TYPE_NONE);

        TileProvider tileProvider = new UrlTileProvider(256, 256) {
            @Override
            public synchronized URL getTileUrl(int x, int y, int zoom) {
                String s = String.format(OPPNADATA_URL, zoom, y, x);
                try {
                    URL url = new URL(s);
                    return url;
                } catch (MalformedURLException e) {
                    throw new AssertionError(e);
                }
            }
        };
        mMap.addTileOverlay(new TileOverlayOptions().tileProvider(tileProvider));
    }
}
