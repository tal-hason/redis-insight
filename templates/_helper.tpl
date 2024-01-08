{{- define "message" -}}
## Redis Insight Helm Chart
{{-end }}

{{- define "app.labels" }}
app: redis-browser
app.kubernetes.io/component: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/part-of: {{ .Release.Name }}
app.openshift.io/runtime: redis
app.openshift.io/runtime-namespace: {{ .Release.Namespace }}
{{- end }}

{{- define "selector.labels" }}
app: {{ .Release.Name }}
deployment: {{ .Release.Name }}
{{- end }}

{{- define "image.name" -}}
{{ .Values.global.container.image }}:{{ .Values.global.container.tag }}
{{- end }}

{{- define "service.name" -}}
{{ .Release.Name }}-{{ .Values.global.service.name }}
{{- end }}

{{- define "host.name" -}}
{{ .Release.Name }}-{{ .Release.Namespace }}.{{ .Values.global.route.appsDomain }}
{{- end }}