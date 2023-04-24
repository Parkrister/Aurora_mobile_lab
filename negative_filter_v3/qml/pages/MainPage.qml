/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import QtQuick.Window 2.2
import Sailfish.Silica 1.0
import NegativeFilter 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property string imageUrl: "https://i.stack.imgur.com/87ZMG.png"

    //NegativeFilter{
    //    id: negativeFilter
    //}

    Column {

        spacing : 10
        Image {
            width: 512; height: 512
            id: img;
            source: imageUrl
        }

        Rectangle {
            color: "gold"; radius: 10.0; width: parent.width; height: 50
            Text {
                anchors.centerIn: parent
                font.pointSize: 24
                text: "кот"
            }
        }

        ShaderEffect {
            width: 512; height: 512
            property variant src: img
            vertexShader: "
                uniform highp mat4 qt_Matrix;
                attribute highp vec4 qt_Vertex;
                attribute highp vec2 qt_MultiTexCoord0;
                varying highp vec2 coord;
                void main() {
                    coord = qt_MultiTexCoord0;
                    gl_Position = qt_Matrix * qt_Vertex;
                }"
            fragmentShader: "
                varying highp vec2 coord;
                uniform sampler2D src;
                uniform lowp float qt_Opacity;
                void main() {
                    lowp vec4 tex = texture2D(src, coord);
                    gl_FragColor = vec4(vec3(dot(tex.rgb,vec3(0.344, 0.5, 0.156))),tex.a) * qt_Opacity;
                }"
        }

        Rectangle {
            color: "lightblue"; radius: 10.0; width: parent.width; height: 50
            Text {
                anchors.centerIn: parent
                font.pointSize: 24
                text: "кот под фильтром"
            }
        }


        /*

        Image{
            width: 512; height: 512
            source:imageUrl
            onSourceChanged: {
                for (var x = 0; x < width; x++){
                    for (var y = 0; y < height; y++){
                        var pixel = get(x, y);
                        set(x, y, Qt.rgba((255 - qRed(pixel), 255 - qGreen(pixel), 255 - qBlue(pixel), qAlpha(pixel))));
                    }
                }
            }
        }

        ShaderEffect {
                id: myShader
                width: 512
                height: 512
                property var myImage: img

                fragmentShader: "
                    uniform sampler2D myImage;
                    varying highp vec2 qt_TexCoord0;
                    uniform highp float width;
                    uniform highp float height;

                    void main() {
                        // sample the image
                        vec4 sample = texture2D(myImage, qt_TexCoord0);
                        float x = qt_TexCoord0.x * width;
                        float y = qt_TexCoord0.y * height;
                        float red = sample.r;
                        float green = sample.g;
                        float blue = sample.b;

                        // create negative image
                        red = 1.0 - red;
                        green = 1.0 - green;
                        blue = 1.0 - blue;

                        gl_FragColor = vec4(red, green, blue, sample.a);
                    }
                "
            }

        ShaderEffect {
            width: 512; height: 512
            property variant src: img
            vertexShader: "
                uniform highp mat4 qt_Matrix;
                attribute highp vec4 qt_Vertex;
                attribute highp vec2 qt_MultiTexCoord0;
                varying highp vec2 coord;
                void main() {
                    coord = qt_MultiTexCoord0;
                    gl_Position = qt_Matrix * qt_Vertex;
                }"
            fragmentShader: "
                varying highp vec2 coord;
                uniform sampler2D src;
                uniform lowp float qt_Opacity;
                void main() {
                    lowp vec4 tex = texture2D(src, coord);
                    gl_FragColor = vec4(vec3(dot(tex.rgb,vec3(0.344, 0.5, 0.156))),tex.a) * qt_Opacity;
                }"
        }



        ShaderEffect {
            width: 512; height: 512
            property variant source: img
            property real strength: 0.5
            property real contrast: 0.5
            property real brightness: 0.5
            property real saturation: 0.5
            property real exposure: 0.5

            fragmentShader: "
                uniform lowp float strength;
                uniform lowp float contrast;
                uniform lowp float brightness;
                uniform lowp float saturation;
                uniform lowp float exposure;

                varying highp vec2 qt_TexCoord0;

                void main(void)
                {
                    lowp vec4 color = texture2D(source, qt_TexCoord0);
                    lowp vec3 rgb = color.rgb;
                    lowp float gray = dot(rgb, vec3(0.3, 0.59, 0.11));

                    // Contrast
                    rgb = (rgb - 0.5) * (1.0 + contrast) + 0.5;

                    // Brightness
                    rgb += brightness;

                    // Saturation
                    rgb += (gray - rgb) * (1.0 - saturation);

                    // Exposure
                    rgb *= pow(2.0, exposure);

                    // Negative filter
                    rgb = 1.0 - rgb;

                    gl_FragColor = vec4(rgb, color.a) * strength;
                }"
        }
        */
    }
}
