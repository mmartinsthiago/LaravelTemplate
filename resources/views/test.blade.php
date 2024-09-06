@extends('layouts.base')

@section('subtitle', 'Home test')

@section('content')
<div class="d-flex flex-content-around">
    <span id="test-btn" class="btn btn-secondary"><i class="bi bi-pdf"></i>{!! __("Click me!") !!}</span>
    <span id="test-text" class="col-4 text-warning d-none">@lang("JQuery and bootstrap are working!")</span>
</div>
@endsection

@push('js-footer')
    <script>
        $(document).ready(function () {
            $('#test-btn').click(function () {
                $('#test-text').removeClass('d-none');;

            });
        });
    </script>
@endpush
