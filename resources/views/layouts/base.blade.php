<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{!! env('APP_NAME') !!} - @yield('subtitle')</title>

        @include('imports.bootstrap-jquery')

        <!-- Other head css -->
        @stack('css-head')
        <!-- Other head js -->
        @stack('js-head')
    </head>
    <body class="d-flex flex-row">
        @include('layouts.header')

        <div class="container">
            @yield('content')
        </div>

        @include('layouts.footer')

        <!-- Some css footer -->
        @stack('css-footer')
        <!-- Some js footer -->
        @stack('js-footer')
    </body>
</html>
