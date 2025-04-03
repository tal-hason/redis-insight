{{- define "message" -}}
## Redis Insight Helm Chart
{{- end }}

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
app: '{{ .Release.Name }}-redis-insight'
deployment: '{{ .Release.Name }}-redis-insight'
{{- end }}

{{- define "image.name" -}}
{{ .Values.global.container.registry }}/{{ .Values.global.container.image }}:{{ .Values.global.container.tag }}
{{- end }}


{{- define "host.name" -}}
{{ .Release.Name }}-redis-insight-{{ .Release.Namespace }}.{{ .Values.global.route.appsDomain }}
{{- end }}